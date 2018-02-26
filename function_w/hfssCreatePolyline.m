% -------------------------------------------------------------------------- %
% function    hfssCreatePolyline(fid, Points, Name, Units)
%
% Description:
% ------------
% Create a CreatePolyline in HFSS. This function also provides 
% an option to punch a bunch of (circular) holes into the polygon object (so
% as to make way for cables, wires, etc.,).
%

% You should have received a copy of the GNU General Public License along with
% Foobar; if not, write to the Free Software Foundation, Inc., 59 Temple 
% Place, Suite 330, ShangHai, CN  20171222
% Copyright 2018, WoodyBuendia (woodybuendia@gmail.com)

function hfssCreatePolyline(fid, Points, Name, Units)
Num_points = length(Points);

fprintf(fid, 'Set oEditor = oDesign.SetActiveEditor("3D Modeler") \n');
fprintf(fid, 'oEditor.CreatePolyline Array("NAME:PolylineParameters", _\n');
fprintf(fid, '"IsPolylineCovered:=", true, "IsPolylineClosed:=",  false, _\n');
fprintf(fid, 'Array("NAME:PolylinePoints", _\n');

Coor = {'X','Y','Z'};
for  i = 1:Num_points-1
    fprintf(fid, 'Array("NAME:PLPoint", _\n');
    clearvars temp
    temp = Points{i,1};
    for j = 1:2
        if isnumeric(temp{1,j})
            fprintf(fid, '"%s:=", "%f%s", _\n', Coor{j},temp{1,j}, Units);
        else
            fprintf(fid, '"%s:=", "%s", _\n', Coor{j}, temp{1,j});
        end
    end
    if isnumeric(temp{1,3})
        fprintf(fid, '"%s:=", "%f%s"),  _\n', Coor{3}, temp{1,3}, Units);
    else
         fprintf(fid, '"%s:=", "%s"),  _\n', Coor{3}, temp{1,3});
    end
    
end

i = Num_points;
fprintf(fid, 'Array("NAME:PLPoint", _\n');
clearvars temp
temp = Points{i,1};
for j = 1:2
        if isnumeric(temp{1,j})
            fprintf(fid, '"%s:=", "%f%s", _\n', Coor{j}, temp{1,j}, Units);
        else
            fprintf(fid, '"%s:=", "%s", _\n', Coor{j}, temp{1,j});
        end
end
if isnumeric(temp{1,3})
    fprintf(fid, '"%s:=", "%f%s")),  _\n', Coor{3}, temp{1,3}, Units);
else
    fprintf(fid, '"%s:=", "%s")),  _\n', Coor{3}, temp{1,3});
end

fprintf(fid, 'Array("NAME:PolylineSegments", Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", 0, _\n');
fprintf(fid, '"NoOfPoints:=", %d)), _\n', Num_points);
fprintf(fid, 'Array("NAME:PolylineXSection", "XSectionType:=",  "None", "XSectionOrient:=", "Auto", _\n');
fprintf(fid, '"XSectionWidth:=", "0mm", "XSectionTopWidth:=", "0mm", "XSectionHeight:=", "0mm", "XSectionNumSegments:=", "0", "XSectionBendType:=", "Corner")), _\n');
fprintf(fid, 'Array("NAME:Attributes", "Name:=", "%s", _\n', Name);
fprintf(fid, '"Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, _\n');
fprintf(fid, '"PartCoordinateSystem:=", "Global", "UDMId:=", "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=", true) \n');

