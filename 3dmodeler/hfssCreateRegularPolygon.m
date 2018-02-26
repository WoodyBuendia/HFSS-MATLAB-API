% -------------------------------------------------------------------------- %
% function    hfssCreateRegularPolygon(fid,name,point_center,point_start,...
%                                      numbersides,axis,units)
%
% Description:
% ------------
% Create a closed polygon object in HFSS. This function also provides 
% an option to punch a bunch of (circular) holes into the polygon object (so
% as to make way for cables, wires, etc.,).
%
% Parameters:
% -----------
% Name - Name Attribute for the Polygon.
% point_center
% point_start
% numbersides
% axis
% units - can be either:
%         'mm' - millimeter.
%         'in' - inches.
%         'mil' - mils.
%         'meter' - meter (note: don't use 'm').
%          or anything that Ansoft HFSS supports. 
%
% Example:
% ----------------------------------------------------------------------------
% This file is part of HFSS-MATLAB-API.
%
% HFSS-MATLAB-API is free software; you can redistribute it and/or modify it 
% under the terms of the GNU General Public License as published by the Free 
% Software Foundation; either version 2 of the License, or (at your option) 
% any later version.
%
% HFSS-MATLAB-API is distributed in the hope that it will be useful, but 
% WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
% or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License 
% for more details.
%
% You should have received a copy of the GNU General Public License along with
% Foobar; if not, write to the Free Software Foundation, Inc., 59 Temple 
% Place, Suite 330, Boston, MA  02111-1307  USA
%
% Copyright 2008, Yue liang (yue_liang423@163.com)
%
% Copyright 2018, WoodyBuendia (woodybuendia@gmail.com)
% -------------------------------------------------------------------------
% ---
function    hfssCreateRegularPolygon(fid,name,point_center,point_start,...
                                     numbersides,axis,Units)
                                 
point_center = reshape(point_center, length(point_center), 1);
if iscell(point_center)
    1;
else
    point_center = mat2cell(point_center,[1,1,1],1);
end

point_start = reshape(point_start, length(point_start), 1);
if iscell(point_start)
    1;
else
    point_start = mat2cell(point_start,[1,1,1],1);
end
% preamble
fprintf(fid, '\n');
fprintf(fid, 'oEditor.CreateRegularPolygon _\n');
fprintf(fid, 'Array("NAME:RegularPolygonParameters", _\n');
fprintf(fid, '"CoordinateSystemID:=", -1, _\n');
fprintf(fid, '"IsCovered:=", true, _\n');

% points

% fprintf(fid, '"XCenter:=", "%f%s", _\n',point_center(1),units);
% fprintf(fid, '"YCenter:=", "%f%s", _\n',point_center(2),units);
% fprintf(fid, '"ZCenter:=", "%f%s", _\n',point_center(3),units);
% fprintf(fid, '"XStart:=", "%f%s", _\n',point_start(1),units);
% fprintf(fid, '"YStart:=", "%f%s", _\n',point_start(2),units);
% fprintf(fid, '"ZStart:=", "%f%s", _\n',point_start(3),units);
if isnumeric(point_center{1,1})
    fprintf(fid, '"XCenter:=", "%f%s", _\n', point_center{1,1}, Units);
else
    fprintf(fid, '"XCenter:=", "%s", _\n', point_center{1,1});
end
    
if isnumeric(point_center{2,1})
    fprintf(fid, '"YCenter:=", "%f%s", _\n', point_center{2,1}, Units);
else
    fprintf(fid, '"YCenter:=", "%s", _\n', point_center{2,1});
end
  
if isnumeric(point_center{3,1})
   fprintf(fid, '"ZCenter:=", "%f%s", _\n', point_center{3,1}, Units);
else
     fprintf(fid, '"ZCenter:=", "%s", _\n', point_center{3,1});
end

if isnumeric(point_start{1,1})
    fprintf(fid, '"XStart:=", "%f%s", _\n', point_start{1,1}, Units);
else
    fprintf(fid, '"XStart:=", "%s", _\n', point_start{1,1});
end 
if isnumeric(point_start{2,1})
    fprintf(fid, '"YStart:=", "%f%s", _\n', point_start{2,1}, Units);
else
    fprintf(fid, '"YStart:=", "%s", _\n', point_start{2,1});
end
if isnumeric(point_start{3,1})
   fprintf(fid, '"ZStart:=", "%f%s", _\n', point_start{3,1}, Units);
else
     fprintf(fid, '"ZStart:=", "%s", _\n', Start{3,1});
end

% sides
if isnumeric(numbersides)
    fprintf(fid, '"NumSides:=", "%d", _\n',numbersides);
else
    fprintf(fid, '"NumSides:=", "%s", _\n',numbersides);
end
fprintf(fid, '"WhichAxis:=", "%s"), _\n',axis);

% Attributes
fprintf(fid, 'Array("NAME:Attributes", "Name:=", "%s", _\n',name);
fprintf(fid, '"Flags:=", "", "Color:=", "(132 132 193)", _\n');
fprintf(fid, '"Transparency:=", 0, "PartCoordinateSystem:=", "Global", _\n');
fprintf(fid, '"MaterialName:=", "vacuum", "SolveInside:=", true) \n');