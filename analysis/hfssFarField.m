% ----------------------------------------------------------------------------
% function hfssBox(fid, Name, Start, Size, Units, [Center1], [Radius1], ...
%                  [Axis1], [Center2], [Radius2], [Axis2], ...)
% 
% Description :
% -------------
% Create the VB Script necessary to create a Box (or Cuboid) in HFSS. This 
% function also provides for optional holes (specified by their Center, 
% Radii and Axes) in the box. This feature is useful to allow things like
% vias, cables etc., to penetrate the box without intersection violations.
%
% Parameters :
% ------------
% fid     - file identifier of the HFSS script file.
% Name    - name of the box (appears in HFSS).
% Start   - starting location of the box (specify as [x, y, z]).
% Size    - size of the box (specify as [sx, sy, sz]).
% Units   - units of the box (specify using either 'in', 'mm', 'meter' or 
%           anything else defined in HFSS).
% Center  - (Optional) center of the hole to be punched through the box.
%           It can lie anywhere within or on the surface of the box.
% Radius  - (Optional) radius of the hole to be punched through the box.
% Axis    - (Optional) axis of the hole to be punched through the box.
% 
% Note :
% ------
% If you happen to specify a hole that lies outside the box, it will have
% no effect. The script will run without interruption. 
%
% Example :
% ---------
% fid = fopen('myantenna.vbs', 'wt');
% ... 
% % a Box with 2 holes punched thro' it.
% hfssBox(fid, 'FR4_Base', [-bpHeight/2, -baseLength/2, 0], [bpHeight, ...
%         baseLength, -baseThick], 'in', [cX1, cY1, cZ1], R1, 'Z',...
%         [cX2, cY2, cZ2], R2, 'X');
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
function hfssFarField(fid, Name, Starttheta, Stoptheta,Steptheta,Startphi,Stopphi,Stepphi, Units)

% Preamble.
fprintf(fid, '\n');
fprintf(fid, 'Set oModule = oDesign.GetModule("RadField")\n');

% Box Parameters.
fprintf(fid, 'oModule.InsertFarFieldSphereSetup _\n');
fprintf(fid, 'Array("NAME:%s", _\n',Name);
fprintf(fid, '"UseCustomRadiationSurface:=",  _\n');
fprintf(fid, '  false, _\n');
fprintf(fid, '"ThetaStart:=", "%d%s", _\n',Starttheta,Units);
fprintf(fid, '"ThetaStop:=", "%d%s", _\n', Stoptheta, Units);
fprintf(fid, '"ThetaStep:=", "%d%s", _\n', Steptheta, Units);

% Box Attributes.
fprintf(fid, '"PhiStart:=", "%d%s", _\n',Startphi,Units);
fprintf(fid, '"PhiStop:=", "%d%s", _\n', Stopphi,Units);
fprintf(fid, '"PhiStep:=", "%d%s", _\n',Stepphi,Units);
fprintf(fid, '"UseLocalCS:=", false)\n');


