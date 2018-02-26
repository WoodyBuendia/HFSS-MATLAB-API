% -------------------------------------------------------------------------- %
% function    hfssCreateReportFF(fid, PlotType,ReportName, VarList, Geometry, Category,Quantity,Function,f)
%
% Description:
% ------------
% Create a Far Fields hfssCreateReport in HFSS. 
% Input:
%   PlotType: 
%               1:Rectangular Plot; 2:3D Polar Plot
%   ReportName: the name of Report, such as "rE Plot 1"
%   VarList: VarList, {} for Nominal to all Var
%   Geometry: "Infinite Sphere2"
%   Quantity: such as 'rERHCP', 'GainTatol'...
%   Function: such as 'abs', 'ang_deg'...
% You should have received a copy of the GNU General Public License along with
% Foobar; if not, write to the Free Software Foundation, Inc., 59 Temple 
% Place, Suite 330, ShangHai, CN  20171224
% Copyright 2018, WoodyBuendia (woodybuendia@gmail.com)

function hfssCreateReportFF(fid, PlotType,ReportName, VarList, Geometry,Quantity,Function,f)

if PlotType == 1
    type = 'Rectangular Plot';
else
    if plotTpye == 2
        type = '3D Polar Plot';
    end
end

Y = [Function,'(',Quantity,')'];

fprintf(fid, '\n');
fprintf(fid, 'Set oModule = oDesign.GetModule("ReportSetup") \n');
fprintf(fid, 'oModule.CreateReport "%s", "Far Fields", _\n', ReportName);
fprintf(fid, '"%s", "Setup1 : LastAdaptive", _\n', type);
fprintf(fid, 'Array("Context:=", "%s"), _\n', Geometry);
fprintf(fid,'Array("Theta:=", Array("All"), "Phi:=", Array("All"), _\n');
fprintf(fid, '"Freq:=", Array("%dGHz")', f);
if length(VarList) >= 1
    fprintf(fid, ', _\n');
    for i = 1:length(VarList)
    fprintf(fid, '"%s:=", Array( "Nominal")', VarList{i});
    if i ~= length(VarList)
        fprintf(fid, ', _\n');
    else
        fprintf(fid, '), _\n');
    end
    end
else
    fprintf(fid, '), _\n');
end

if PlotType == 1
    fprintf(fid, 'Array("X Component:=", "Theta", "Y Component:=", Array("%s")), Array() \n',Y);
else
    if PlotType == 2
        fprintf(fid, 'Array("Phi Component:=", "Phi", "Theta Component:=", "Theta", "Mag Component:=", Array("%s")), Array()',Y);
    end
end
fprintf(fid, '\n');
