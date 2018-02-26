% ----------------------------------------------------------------------------
% function hfssRectangle(fid, Name, Axis, Start, Width, Height, Units)
% 20160803 修改 将XPosition修改成XStart, YZ相同
%修改原因：使用XPosition无法将矩形起始点参数化-woody
% Description :
% -------------
% Create the VB Script necessary to construct a rectangle using the HFSS
% 3D Modeler.
%
% Parameters :
% ------------
% fid     - file identifier of the HFSS script file.
% Name    - name of the rectangle object (appears in the HFSS objects tree).
% Axis    - axis that is normal to the rectangle object.
% Start   - starting location of the rectangle (one of its corners). Specify
%           as [sx, sy, sz].
% Width   - (scalar) the width of the rectangle. If the axis is 'X' then this 
%           represents the Y-axis size of the rectangle, and so on.
% Height  - (scalar) the height of the rectangle. If the axis is 'X', then 
%           this represents the Z-axis size of the rectangle, and so on. 
% Units   - specify as 'in', 'meter', 'mm', ... or anything else defined in 
%           HFSS.
%
% Note :
% ------
% Todo: a feature to add automatic holes in the rectangle object.
%
% Example :
% ---------
% fid = fopen('myantenna.vbs', 'wt');
% ... 
% % in this example, Y-axis size is 10in and Z-axis size is 20in.
% hfssRectangle(fid, 'Rect1', 'X', [0,0,0], 10, 20, 'in');
%
% ----------------------------------------------------------------------------

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
% Copyright 2004, Vijay Ramasami (rvc@ku.edu)
% Copyright 2018, WoodyBuendia (woodybuendia@gmail.com)
% ----------------------------------------------------------------------------
% Width and Height follow the right-hand rule. If the Axis is Z, then Width
% represents X-direction size and Height represents the Y-direction size 
% and so on ...
function hfssRectangle(fid, Name, Axis, Start, Width, Height, Units)

Transparency = 0.5;

Start = reshape(Start, length(Start), 1);
if iscell(Start)
    1;
else
    Start = mat2cell(Start,[1,1,1],1);
end
% Preamble.
fprintf(fid, '\n');
fprintf(fid, 'oEditor.CreateRectangle _\n');

% Rectangle Parameters.
fprintf(fid, 'Array("NAME:RectangleParameters", _\n');
fprintf(fid, '"IsCovered:=", true, _\n');
if isnumeric(Start{1,1})
    fprintf(fid, '"XStart:=", "%f%s", _\n', Start{1,1}, Units);
else
    fprintf(fid, '"XStart:=", "%s", _\n', Start{1,1});
end 
if isnumeric(Start{2,1})
    fprintf(fid, '"YStart:=", "%f%s", _\n', Start{2,1}, Units);
else
    fprintf(fid, '"YStart:=", "%s", _\n', Start{2,1});
end
if isnumeric(Start{3,1})
   fprintf(fid, '"ZStart:=", "%f%s", _\n', Start{3,1}, Units);
else
     fprintf(fid, '"ZStart:=", "%s", _\n', Start{3,1});
end

if isnumeric(Width)
    fprintf(fid, '"Width:=", "%f%s", _\n', Width, Units);
else
    fprintf(fid, '"Width:=", "%s", _\n', Width);
end

if isnumeric(Height)
    fprintf(fid, '"Height:=", "%f%s", _\n', Height, Units);
else
        fprintf(fid, '"Height:=", "%s", _\n', Height);
end




fprintf(fid, '"WhichAxis:=", "%s"), _\n', upper(Axis));

% Rectangle Attributes.
fprintf(fid, 'Array("NAME:Attributes", _\n');
fprintf(fid, '"Name:=", "%s", _\n', Name);
fprintf(fid, '"Flags:=", "", _\n');
fprintf(fid, '"Color:=", "(132 132 193)", _\n');
fprintf(fid, '"Transparency:=", %d, _\n', Transparency);
fprintf(fid, '"PartCoordinateSystem:=", "Global", _\n');
fprintf(fid, '"MaterialName:=", "vacuum", _\n');
fprintf(fid, '"SolveInside:=", true)\n');
