% ----------------------------------------------------------------------------
% function hfssCopy(fid, Name)
% 
% Description :
% -------------
% Create the VB Script necessary to construct a rectangle using the HFSS
% 3D Modeler.
%
% Parameters :
% ------------
% fid     - file identifier of the HFSS script file.
% Name    - name of which you want to copy
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
% Copyright 2008, Yueliang (yue_liang423@163.com)
% -------------------------------------------------------------------------
function hfssCopy(fid, Name)

% Preamble.
fprintf(fid, '\n');
fprintf(fid, 'oEditor.Copy _\n');

fprintf(fid, 'Array("NAME:Selections", "Selections:=", "%s") \n',Name);
fprintf(fid, 'oEditor.Paste');