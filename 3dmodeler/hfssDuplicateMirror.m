% ----------------------------------------------------------------------------
% function hfssDuplicateMirror(fid, ObjectList, dVector, Units, ...
%				               [dupBoundaries = true])
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
% dVector    - (vector) the translation vector for the duplication process 
%              (specified as [dx, dy, dz]).
% Units      - specified as either 'mm', 'meter', 'in' or anything else 
%              defined in HFSS.
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
% ----------------------------------------------------------------------------

function hfssDuplicateMirror(fid, ObjectList, dVector, Units, ...
				             dupBoundaries)


% arguments processor.
if (nargin < 4)
	error('Insufficient number of arguments !');
elseif (nargin < 5)
	dupBoundaries = [];
end;

% default arguments.
if isempty(dupBoundaries)
	dupBoundaries = false;
end;

nObjects = length(ObjectList);

% Preamble.
fprintf(fid, '\n');
fprintf(fid, 'oEditor.DuplicateMirror _\n');
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

% Duplication Vectors.
fprintf(fid, 'Array("NAME:DuplicateToMirrorParameters", _\n');
fprintf(fid, '"DuplicateMirrorBaseX:=", "%f%s", _\n', 0, Units);
fprintf(fid, '"DuplicateMirrorBaseY:=", "%f%s", _\n', 0, Units);
fprintf(fid, '"DuplicateMirrorBaseZ:=", "%f%s", _\n', 0, Units);
fprintf(fid, '"DuplicateMirrorNormalX:=", "%f%s", _\n', dVector(1), Units);
fprintf(fid, '"DuplicateMirrorNormalY:=", "%f%s", _\n', dVector(2), Units);
fprintf(fid, '"DuplicateMirrorNormalZ:=", "%f%s"), _\n', dVector(3), Units);


% Duplicate Boundaries with Geometry or not.
fprintf(fid, 'Array("NAME:Options", _\n');
if (dupBoundaries)
	fprintf(fid, '"DuplicateBoundaries:=", true)\n');
else
	fprintf(fid, '"DuplicateBoundaries:=", false)\n');
end;