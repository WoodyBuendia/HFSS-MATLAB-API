% ----------------------------------------------------------------------------
% function hfssRectangle(fid, Name, Axis, Start, Width, Height, Units)
% 
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
% ----------------------------------------------------------------------------
% Width and Height follow the right-hand rule. If the Axis is Z, then Width
% represents X-direction size and Height represents the Y-direction size 
% and so on ...
function hfssPH(fid,Name)

%Transparency = 0.5;

% Preamble.
fprintf(fid, '\n');
fprintf(fid, 'Set oModule = oDesign.GetModule("BoundarySetup")\n');
fprintf(fid, 'oModule.AssignPerfectH _\n');

% Rectangle Parameters.
fprintf(fid, 'Array("NAME:PerfH%s", _\n',Name);
fprintf(fid, '"Objects:=", _\n');
fprintf(fid, 'Array("%s"), _\n',Name);
fprintf(fid, '"InfGroundPlane:=", _\n');

fprintf(fid, 'false)\n');         %...........第一个点