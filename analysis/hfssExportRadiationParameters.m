% ----------------------------------------------------------------------------
% function hfssExportRadiationParameters(fid, fileName, setupName, solutionName, freq)
% 
% Description :
% -------------
% Creates the VB Script necessary for HFSS to export the max quantities of a 
% near-field setup and,in the case of far fields,the antenna parameters to 
% the specified file.
%
% Parameters :
% ------------
% fid       - file identifier of the HFSS script file.
% fileName  - outdata data file name.
% setupName - the name of the Radiation Setup whose solution data needs to
%             be exported.
% solutionName - the name of the Solution Setup whose solution data needs to 
%             be exported.
% freq      - the frequency of the design.
% 
% Note :
% ------
%
% Example :
% ---------
% fid = fopen('myantenna.vbs', 'wt');
% ... 
% hfssExportNetworkData(fid, 'C:\temp\tempData.m', 'InfiniteSphere1', ...
%                       'horn500MHz', 0.1);
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

function hfssExportRadiationParameters(fid, fileName, setupName, solutionName, freq)

fprintf(fid, '\n');
fprintf(fid, 'Set oModule = oDesign.GetModule("RadField") \n');
fprintf(fid, 'oModule.ExportRadiationParametersToFile _\n');
fprintf(fid, 'Array("ExportFileName:=", _\n');
fprintf(fid, '        "%s", _\n', fileName);
fprintf(fid, '        "SetupName:=", "%s", _\n', setupName);
fprintf(fid, '        "IntrinsicVariationKey:=", "Freq=''%fGHz''", _\n', freq);
fprintf(fid, '        "DesignVariationKey:=", "", _\n');
fprintf(fid, '        "SolutionName:=", "%s") \n', solutionName);


