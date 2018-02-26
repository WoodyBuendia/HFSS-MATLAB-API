% ----------------------------------------------------------------------------
% function hfssCone(fid, Name, Axis, Center, BottomRadius, TopRadius, Height, Units)
% 
% Description :
% -------------
% Creates the VB script necessary to model a cone in HFSS.
%
% Parameters :
% ------------
% fid     - file identifier of the HFSS script file.
% Name    - name of the cone (in HFSS).
% Center  - center of the cone (specify as [x, y, z]). This is also the 
%           starting point of the cone.
% Axis    - axis of the cone (specify as 'X', 'Y', or 'Z').
% BottomRadius  - radius of the cone (scalar).
% TopRadius     - radius of the cone (scalar).
% Height  - height of the cone (from the point specified by Center).
% Units   - specify as 'in', 'mm', 'meter' or anything else defined in HFSS.
% 
% Note :
% ------
%
% Example :
% ---------
% fid = fopen('myantenna.vbs', 'wt');
% ... 
% hfssCone(fid, 'Cone1', 'Z', [0, 0, 0], 0.1, 0.2, 10, 'in');
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
% Copyright 2007, YueLiang (yue_liang423@163.com)
% ----------------------------------------------------------------------------
function hfssCone(fid, Name, Axis, Center, BottomRadius, TopRadius, Height, Units)

% Preamble.
fprintf(fid, 'oEditor.CreateCone _\n');
fprintf(fid, 'Array("NAME:ConeParameters", _\n');

% Parameters.
fprintf(fid, '"XCenter:=", "%f%s", _\n', Center(1), Units);
fprintf(fid, '"YCenter:=", "%f%s", _\n', Center(2), Units);
fprintf(fid, '"ZCenter:=", "%f%s", _\n', Center(3), Units);
fprintf(fid, '"WhichAxis:=", "%s", _\n', upper(Axis));
fprintf(fid, '"Height:=", "%f%s", _\n', Height, Units);
fprintf(fid, '"BottomRadius:=", "%f%s", _\n', BottomRadius, Units);
fprintf(fid, '"TopRadius:=", "%f%s"), _\n', TopRadius, Units);

% Attributes.
fprintf(fid, 'Array("NAME:Attributes", _\n');
fprintf(fid, '"Name:=", "%s", _\n', Name);
fprintf(fid, '"Flags:=", "", _\n');
fprintf(fid, '"Color:=", "(132 132 193)", _\n');
fprintf(fid, '"Transparency:=", 0, _\n');
fprintf(fid, '"PartCoordinateSystem:=", "Global", _\n');
fprintf(fid, '"MaterialName:=", "vacuum", _\n');
fprintf(fid, '"SolveInside:=", true)\n');