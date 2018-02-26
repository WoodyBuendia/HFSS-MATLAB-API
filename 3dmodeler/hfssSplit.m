% ----------------------------------------------------------------------------
% hfssSplit(fid, splitplane, side, varargin)
%
% Description:
% ------------
% Creates the necessary VB script to split specified objects along a palne.
%
% Parameters :
% ------------
% fid        - file identifier of the HFSS script file.
% varargin   - names of the objects that need to be splited. It can be specified
%              either as a single cell array of strings, or several individual
%              cell strings containing a single object name (see example ...)
% splitplane - the specified plane such as 'XY','YZ' and 'ZX'.
% side       - the part you want to remain. Possible values are 'Both',
%              'PositiveOnly','NegativeOnly'.
%
% Example :
% ---------
% fid = fopen('myantenna.vbs', 'wt');
% ... 
% hfssSplit(fid, 'XY', 'PositiveOnly', {'one','two',...});
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
% -------------------------------------------------------------------------

function    hfssSplit(fid, splitplane, side, varargin)

% Preamble.
fprintf(fid, '\n');
fprintf(fid, 'oEditor.Split _\n');
fprintf(fid, 'Array("NAME:Selections", _\n');
fprintf(fid, '"Selections:=", ');

% If the first argument is a cell then it contains a cell of strings that must
% be united, else each argument is a cell.
if (iscell(varargin{1}))
	Objects = varargin{1};
else
	Objects = varargin;
end;

% Total # of Objects.
nObjects = length(Objects);

% Add the Objects.
fprintf(fid, '"');
for iP = 1:nObjects-1,
	fprintf(fid, '%s,', Objects{iP});
end;
fprintf(fid, '%s"), _\n', Objects{nObjects});

% Postamble.
fprintf(fid, 'Array("NAME:SplitToParameters", "CoordinateSystemID:=", -1, _\n');
fprintf(fid, '"SplitPlane:=", "%s", _\n', splitplane);
fprintf(fid, '"WhichSide:=", "%s", _\n', side);
fprintf(fid, '"SplitCrossingObjectsOnly:=", false) \n');
