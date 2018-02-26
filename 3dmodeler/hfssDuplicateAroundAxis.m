% ----------------------------------------------------------------------------
% function hfssDuplicateAroundAxis(fid, ObjectList, Axis, DupAngle,...
%                                  [dupBoundaries = true])
% 
% Description :
% -------------
% Creates the VB Script necessary to duplicate specified parts according to
% a mirror plane.
%
% Parameters :
% ------------
% fid        - file identifier of the HFSS script file.
% ObjectList - a cell-array of strings that represent the objects to be 
%              cloned.
% Axis       - axis around which Object is to be duplicate.
% DupAngle   - angle (in *deg*) over which the object is to be duplicate.
% [dupBoundaries] - (optional, boolean) set to false if you wish NOT to 
%                   duplicate boundaries along with the geometry.
% 
% Note :
% ------
% If you have used this 3D modeler feature before, then you will probably
% realize that if the original object (to be cloned) has the name 'Name',
% then the cloned objects will have names 'Name1', 'Name2', ... This applies
% to the cloned boundaries and excitations also.
%
% Example :
% ---------
% fid = fopen('myantenna.vbs', 'wt');
% ... 
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
% ---
function hfssDuplicateAroundAxis(fid, ObjectList, Axis, DupAngle,NumClones,...
                                 dupBoundaries)
                             
% arguments processor.
if (nargin < 5)
	error('Insufficient number of arguments !');
elseif (nargin < 6)
	dupBoundaries = [];
end;

% default arguments.
%if isempty(dupBoundaries)
%	dupBoundaries = false;
%end;

nObjects = length(ObjectList);

% Preamble.
fprintf(fid, '\n');
fprintf(fid, 'oEditor.DuplicateAroundAxis _\n');
fprintf(fid, 'Array("NAME:Selections", _\n');

% Object Selections.
fprintf(fid, '"Selections:=", "');
for iObj = 1:nObjects,
	fprintf(fid, '%s', ObjectList{iObj});
	if (iObj ~= nObjects)
		fprintf(fid, ',');
	end;
end;
fprintf(fid, '"), _\n');

% Duplication Around Axis.
fprintf(fid, 'Array("NAME:DuplicateAroundAxisParameters", _\n');
fprintf(fid, '"WhichAxis:=", "%s", _\n', Axis);
%fprintf(fid, '"AngleStr:=", "%fdeg", _\n', DupAngle);
if isnumeric(DupAngle)
    fprintf(fid, '"AngleStr:=", "%fdeg", _\n', DupAngle);
else
    fprintf(fid, '"AngleStr:=", "%s", _\n', DupAngle);
    
end
%fprintf(fid, '"NumClones:=", %f), _\n', NumClones);
if isnumeric(NumClones)
    fprintf(fid, '"NumClones:=", %f), _\n', NumClones);
else
    fprintf(fid, '"NumClones:=", "%s"), _\n', NumClones);
end

% Duplicate Boundaries with Geometry or not.
fprintf(fid, 'Array("NAME:Options", _\n');
if  1 == isempty(dupBoundaries)
	fprintf(fid, '"DuplicateBoundaries:=", false)\n');
else
	fprintf(fid, '"DuplicateBoundaries:=", true)\n');
end