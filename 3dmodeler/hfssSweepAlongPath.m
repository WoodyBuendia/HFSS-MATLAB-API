% ----------------------------------------------------------------------------
% function hfssSweepAlongPath(fid, Object)
%
% Description:
% ------------
% Creates the VB Script necessary to sweep a 2D object around the given axis
% to create a 3D object. 
% 
% Parameters:
% -----------
% fid        - file identifier of the HFSS script file.
% Object     - name of the Object to be sweeped.
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
% Copyright 2008, Yueliang (yue_liang423@163.com)
% -------------------------------------------------------------------------
function    hfssSweepAlongPath(fid, Object)

fprintf(fid, '\n');
fprintf(fid, 'oEditor.SweepAlongPath _\n');
fprintf(fid, '  Array("NAME:Selections", "Selections:=", "%s,%s"), _\n', Object{1},Object{2});
fprintf(fid, '  Array("NAME:PathSweepParameters", _\n');
fprintf(fid, '    "CoordinateSystemID:=", -1, _\n');
fprintf(fid, '    "DraftAngle:=", "0deg", _\n');
fprintf(fid, '    "DraftType:=", "Round", _\n');
fprintf(fid, '    "CheckFaceFaceIntersection:=", false, _\n');
fprintf(fid, '    "TwistAngle:=", "0deg") \n');
