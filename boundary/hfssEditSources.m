% ----------------------------------------------------------------------------
% function hfssEditSources(fid, num, name, mag, phase)
% 
% Description :
% -------------
% Creates the VB Script necessary to indicates which source excitations 
% should be used for fields post processing.
%
% Parameters :
% ------------
% fid         - file identifier of the HFSS script file.
% num         - the number of source.
% name        - a source name is typically the name of the associated
%               excitation.
% mag         - this gives the mag of the complex excitation for each
%               source.
% phase       - this gives the phase in degrees of the complex excitation
%               for each source.
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
% ---
function    hfssEditSources(fid, num, name, mag, phase)

% preamble
fprintf(fid, '\n');
fprintf(fid, 'Set oModule = oDesign.GetModule("Solutions") \n');
fprintf(fid, 'oModule.EditSources "TotalFields", _\n');
fprintf(fid, 'Array("NAME:Names", _\n');
for i = 1:num-1
    fprintf(fid, '"%s", _\n', name{i});
end
fprintf(fid, '"%s"), Array("NAME:Modes", _\n', name{num});
for i = 1:num-1
    fprintf(fid, '1, ');
end
fprintf(fid, '1), Array("NAME:Magnitudes", _\n');
for i = 1:num-1
    fprintf(fid, '"%fw", ', mag(i));
end
fprintf(fid, '"%fw"), Array("NAME:Phases", _\n', mag(num));
for i = 1:num-1
    fprintf(fid, '"%fdeg", ', phase(i));
end
fprintf(fid, '"%fdeg"), Array("NAME:Terminated"), _\n', phase(num));
fprintf(fid, 'Array("NAME:Impedances"), _\n');
fprintf(fid, '  false, false,false,"1W"');