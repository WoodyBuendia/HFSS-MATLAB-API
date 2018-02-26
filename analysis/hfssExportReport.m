% ----------------------------------------------------------------------------
% function hfssExportReport(fid, designName, reportName, fileName)
% 
% Description :
% -------------
% Creates the VB Script necessary for HFSS to From a data table or plot, 
% generates text format, comma delimited, tab delimited, or .dat type output 
% files.
%
% Parameters :
% ------------
% fid       - file identifier of the HFSS script file.
% designName- the name of active design.
% reportName- the name of report
% fileName  - outdata data file name.
% 
% Note :
% ------
%
% Example :
% ---------
% fid = fopen('myantenna.vbs', 'wt');
% ... 
% hfssExportNetworkData(fid, 'HFSSModel1', 'plot1', 'c:\temp\report1.dat'); 
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

function hfssExportReport(fid, designName, reportName, fileName)

fprintf(fid, '\n');
fprintf(fid, 'Set oDesign = oProject.SetActiveDesign("%s") \n', designName);
fprintf(fid, 'oDesign.ExportReport "%s", "%s" \n', reportName, fileName);