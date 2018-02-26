% ----------------------------------------------------------------------------
% function hfssAssignLumpedPort(fid, Name, ObjName, iLStart, iLEnd, Units, 
%                               [Resistance = 50.0], [Reactance = 0.0])
% 
% Description :
% -------------
% Create the necessary VB Script to assign a Lumped Port to a given Object.
%
% Parameters :
% ------------
% fid     - file identifier of the HFSS script file.
% Name    - name of the lumped port (appears under 'Boundaries' in HFSS).
% ObjName - name of the (sheet-like) object to which the lumped port is to 
%           be assigned.
% iLStart - (vector) starting point of the integration line. Specify as
%           [x, y, z].
% iLEnd   - (vector) ending point of the integration line. Specify as
%           [x, y, z].
% Units   - specify as 'meter', 'in', 'cm' (defined in HFSS).
% [Resistance] - (scalar, optional) the port resistance (defaults to 
%                50.0 Ohms)
% [Reactance]  - (scalar, optional) the port reactance (defaults to 
%                0.0 Ohms)
% 
% Note :
% ------
% Integration Lines are mandatory in lumped ports.
%
% Example :
% ---------
% fid = fopen('myantenna.vbs', 'wt');
% ... 
% hfssAssignLumpedPort(fid, 'LumpedPort', 'GapSource', [-gapL/2, 0, 0], ...
%	                 [gapL/2, 0, 0], 'meter', 75, 0);
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

function hfssAssignLumpedPort_w(fid, Name, ObjName, iLStart, iLEnd, Units, ...
                              Resistance, Reactance)
iLStart = reshape(iLStart, length(iLStart), 1);
if iscell(iLStart) ~= 1
    iLStart = mat2cell(iLStart,[1,1,1],1);
end

iLEnd = reshape(iLEnd, length(iLEnd), 1);
if iscell(iLEnd) ~= 1
    iLEnd = mat2cell(iLEnd,[1,1,1],1);
end

for i = 1:3
   if isnumeric(iLStart{i,1})
       iLStart{i,1} = [num2str(iLStart{i,1}), Units];
   end
   if isnumeric(iLEnd{i,1})
       iLEnd{i,1} = [num2str(iLEnd{i,1}), Units];
   end
end

% arguments processor.
if (nargin < 6)
	error('Not Enough Arguments !');
elseif (nargin < 7)
	Resistance = [];
	Reactance = [];
elseif (nargin < 8)
	Reactance = [];
end;

% Setup default arguments.
if isempty(Resistance)
	Resistance = 50.0;
end;

if isempty(Reactance)
	Reactance = 0.0;
end;

% The usual fprintf stuff.
fprintf(fid, '\n');
fprintf(fid, 'Set oModule = oDesign.GetModule("BoundarySetup")\n');

fprintf(fid, 'oModule.AssignLumpedPort _\n');
fprintf(fid, 'Array("NAME:%s", _\n', Name);
fprintf(fid, '      "Objects:=", Array("%s"), _\n', ObjName);
fprintf(fid, '"RenormalizeAllTerminals:=", true, _\n');
fprintf(fid, '"DoDeembed:=", false, _\n');
fprintf(fid, '      Array("NAME:Modes", _\n');
fprintf(fid, '             Array("NAME:Mode1", _\n');
fprintf(fid, '                   "ModeNum:=", 1, _\n');
fprintf(fid, '                   "UseIntLine:=", true, _\n');
fprintf(fid, '                   Array("NAME:IntLine", _\n');
fprintf(fid, '                          "Start:=", Array("%s", "%s", "%s"), _\n', ...
        iLStart{1,1}, iLStart{2,1}, iLStart{3,1});
fprintf(fid, '                          "End:=",   Array("%s", "%s", "%s") _\n', ...
        iLEnd{1,1}, iLEnd{2,1}, iLEnd{3,1});
fprintf(fid, '                         ), _\n');
fprintf(fid, '                   "CharImp:=", "Zpi", _\n');
fprintf(fid, '"AlignmentGroup:=",  0, _\n');
fprintf(fid, '"RenormImp:=", "50ohm")), _\n');
fprintf(fid, '      "Resistance:=", "%.3fOhm", _\n', Resistance);
fprintf(fid, '      "Reactance:=", "%.3fOhm" _\n', Reactance);

fprintf(fid, '      )\n');

