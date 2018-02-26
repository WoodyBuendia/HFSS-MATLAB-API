% ----------------------------------------------------------------------------
% function hfssFarFieldSphere(fid, Name, TStart, TStop, TStep, PStart, PStop, PStep)
% 
% Description :
% -------------
% Creates the VB script to creats/inserts a far-field infinite sphere
% radiation setup.
% 
% Parameters :
% ------------
% fid       - file identifier of the HFSS script file.
% SetupName - name of the setup to be solved.
% TStart    - the start degree of theta
% TStop     - the stop degree of theta
% TStep     - the step of degree
% PStart    - the start degree of phi
% PStop     - the stop degree of phi
% PStep     - the step of phi
% Note :
% ------
%
% Example :
% ---------
% fid = fopen('myantenna.vbs', 'wt');
% ... 
% hfssFarFieldSphere(fid, 'FFSphere', -180, 180, 2, 0, 360, 2);
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
%add UseLocalCS, don't use local CS is default when no input CSName
% ----------------------------------------------------------------------------

function hfssFarFieldSphere(fid, Name, TStart, TStop, TStep, PStart, PStop, PStep,CSName)
if  nargin < 9
    UseLocalCS = 0;
else
    UseLocalCS = 1;
end
fprintf(fid, '\n');
fprintf(fid, 'Set oModule = oDesign.GetModule("RadField") \n');
fprintf(fid, 'oModule.InsertFarFieldSphereSetup _\n');
fprintf(fid, 'Array("NAME:%s", _\n', Name);
fprintf(fid, '"UseCustomRadiationSurface:=", false, _\n');
fprintf(fid, '"ThetaStart:=", "%ddeg", _\n', TStart);
fprintf(fid, '"ThetaStop:=", "%ddeg", _\n', TStop);
fprintf(fid, '"ThetaStep:=", "%ddeg", _\n', TStep);
fprintf(fid, '"PhiStart:=", "%ddeg", _\n', PStart);
fprintf(fid, '"PhiStop:=", "%ddeg", _\n', PStop);
fprintf(fid, '"PhiStep:=", "%ddeg", _\n', PStep);
if UseLocalCS == 0
    fprintf(fid, '"UseLocalCS:=", false) \n');
else
    fprintf(fid, '"UseLocalCS:=", true, _\n');
    fprintf(fid, '"CoordSystem:=", "%s")', CSName);
end

