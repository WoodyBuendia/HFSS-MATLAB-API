% ----------------------------------------------------------------------------
% function hfssAssignWavePort_face(fid, PortName, FaceID, nModes, isLine, ...
%			    intStart, intEnd, Units)
% 
% Description :
% -------------
% Creates the VB Script necessary to assign a waveport to a face.
%
% Parameters :
% ------------
% fid         - file identifier of the HFSS script file.
% PortName    - name of the wave port (will appear under 'Boundaries').
% FaceID      - ID of the face to which the wave port is
%               to be assigned.
% nModes      - # of modes.
% isLine      - a boolean array of length (nModes) that specifies whether the
%               corresponding mode has an integration line or not.
% intStart    - (nModes x 3 matrix) an array of vectors that represent the
%               starting points for the integration lines for the 
%               respective modes (see note).
% intEnd      - (nModes x 3 matrix) an array of vectors that represent the
%               ending points for the integration lines for the 
%               respective modes (note note).
% Units       - specify as either 'in', 'meter', 'mm' or anything else
%               defined in HFSS.
%
% Note :
% ------
% 1. if an integration line is not required for a particular mode, then the
%    corresponding entries in intStart and intEnd are ignored.
% 2. mostly, we will be using a single-mode and a single integration line.
%
% Example :
% ---------
% fid = fopen('myantenna.vbs', 'wt');
% ... 
% % single mode, no integration line specified.
% hfssAssignWavePort(fid, Name, 8, 1, false, [0,0,0], ...
%                  [0,0,0], Units);
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
% Copyright 2007, YueLiang (yue_liang423@163.com)
% ----------------------------------------------------------------------------

function hfssAssignWavePort_face2(fid, PortName)

% Preamble.
fprintf(fid, '\n');
fprintf(fid, 'Set oModule = oDesign.GetModule("BoundarySetup") \n');
fprintf(fid, 'oModule.AssignWavePort _\n');
fprintf(fid, 'Array("NAME:1", _\n');
fprintf(fid, '"Objects:=", Array("%s"), _\n',PortName);
fprintf(fid, '"NumModes:=", 1, _\n');
fprintf(fid, '"RenormalizeAllTerminals:=", _\n');
fprintf(fid, 'true, _\n');
fprintf(fid, '"UseLineModeAlignment:=", false, _\n');
fprintf(fid, '"DoDeembed:=", false, _\n');
fprintf(fid, 'Array("NAME:Modes", _\n');
fprintf(fid, 'Array("NAME:Mode1", _\n');
fprintf(fid, '"ModeNum:=", 1, _\n');
fprintf(fid, '"UseIntLine:=", false)), _\n');
fprintf(fid, '"ShowReporterFilter:=", false, _\n');
fprintf(fid, '"ReporterFilter:=", _\n');
fprintf(fid, 'Array( true), _\n');
fprintf(fid, '"UseAnalyticAlignment:=", false)\n');









