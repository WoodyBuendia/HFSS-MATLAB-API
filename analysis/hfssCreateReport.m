% ----------------------------------------------------------------------------
% function hfssCreateReport(fid, reportName, reportType, displayType,...
%                           solutionName, context, freq)
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
% reportName- the name of report
% reportType - Possible values are:
%       "Modal S Parameters" - Only for Driven Modal solution-type problems with ports.
%       "Terminal S Parameters" - Only for Driven Terminal solution-type problems with ports.
%       "Eigenmode Parameters" - Only for Eigenmode solution-type problems.
%       "Fields" 
%       "Far Fields" - Only for problems with radiation or PML boundaries.
%       "Near Fields" - Only for problems with radiation or PML boundaries.
%       |Emission Test|
% displayType - If ReportType is "Modal S Parameters", "Terminal S Parameters", 
%       or "Eigenmode Parameters", then set to one of the following:
%       "Rectangular Plot", "Polar Plot", "Radiation Pattern",
%       "Smith Chart", "Data Table", "3D Rectangular Plot", or "3D Polar Plot".
%       If <ReportType> is "Fields", then set to one of the following:
%       "Rectangular Plot", "Polar Plot", "Radiation Pattern",
%       "Data Table", or "3D Rectangular Plot".
%       If <ReportType> is "Far Fields" or "Near Fields", then set to one of the following:
%       "Rectangular Plot", "Radiation Pattern", "Data Table", 
%       "3D Rectangular Plot", or "3D Polar Plot"
%       If <ReportType> is ¡°Emission Test¡±, then set to one of the following: 
%       ¡°Rectangular Plot¡± or ¡°Data Table¡±
% solutionName - Name of the solution as listed in the Modify Report dialog box.
% context - Context for which the expression is being evaluated. 
% freq - the frequency of the project.
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
% Copyright 2008, YueLiang (yue_liang423@163.com)
% -------------------------------------------------------------------------
% ---

function hfssCreateReport(fid, reportName, reportType, displayType,...
                          solutionName, context, freq)

% preamble
fprintf(fid, '\n');
fprintf(fid, 'Set oModule = oDesign.GetModule("ReportSetup") \n');
fprintf(fid, 'oModule.CreateReport _\n');

% reportname
fprintf(fid, '"%s", _\n', reportName);
% reporttype
fprintf(fid, '"%s", _\n', reportType);
% displaytype
fprintf(fid, '"%s", _\n', displayType);
% solutionname
fprintf(fid, '"%s : LastAdaptive", _\n', solutionName);
% context
fprintf(fid, 'Array("Context:=", "%s"), _\n', context);

% sorry, this is just fo my work, you can modify it by yourself.
fprintf(fid, 'Array("Phi:=", Array( "All"), "Theta:=", Array("All"), "Freq:=", Array("%fGHz")), _\n', freq);
fprintf(fid, 'Array("X Component:=", "Theta", "Y Component:=", Array("GainTotal")), _\n');
fprintf(fid, 'Array() \n');