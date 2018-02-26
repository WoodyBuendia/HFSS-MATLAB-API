% ----------------------------------------------------------------------------
% function hfssSweepAlongVector(fid, Object2D, SweepVector, Units,...
%                               [DraftAngle = 0 deg], [DraftType = 'Round'])
%
% Description:
% ------------
% Creates the VB Script necessary to sweep the specified 1D or 2D parts
% along a vector.
% 
% Parameters:
% -----------
% fid        - file identifier of the HFSS script file.
% Object2D   - name of the 2D Object to be sweeped.
% SweepVector - the vector of the object sweep along.
% DraftAngle - angle (in *deg*) to which the object's profile, or shape is 
%              expanded (or contracted) as it is swept.
% DraftType  - set it to either 'Round' (default), 'Extended' or 'Natural'
%              (consult the HFSS Help for more info).
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
function hfssSweepAlongVector(fid, Object2D, SweepVector, Units,...
                              DraftAngle, DraftType)

% arguments processor.
if (nargin < 4)
	error('Not enough arguments !');
elseif (nargin < 5)
	DraftAngle = 0;
	DraftType = 'Round';
elseif (nargin < 6)
	DraftType = 'Round';
end;

% default arguments.
if isempty(DraftAngle)
	DraftAngle = 0;
end;
if isempty(DraftType)
	DraftType = 'Round';
end;

fprintf(fid, '\n');

fprintf(fid, 'oEditor.SweepAlongVector _\n');
fprintf(fid, '\tArray("NAME:Selections", "Selections:=", "%s"), _\n', Object2D);
fprintf(fid, '\tArray("NAME:VectorSweepParameters", _\n');
fprintf(fid, '\t\t"CoordinateSystemID:=", -1, _\n');
fprintf(fid, '\t\t"DraftAngle:=", "%fdeg", _\n', DraftAngle);
fprintf(fid, '\t\t"DraftType:=", "%s", _\n', DraftType);
fprintf(fid, '\t\t"CheckFaceFaceIntersection:=", false, _\n');
fprintf(fid, '\t\t"SweepVectorX:=", "%f%s", _\n', SweepVector(1), Units);
fprintf(fid, '\t\t"SweepVectorY:=", "%f%s", _\n', SweepVector(2), Units);
fprintf(fid, '\t\t"SweepVectorZ:=", "%f%s") \n', SweepVector(3), Units);