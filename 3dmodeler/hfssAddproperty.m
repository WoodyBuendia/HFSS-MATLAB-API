% ----------------------------------------------------------------------------
% function hfssChangeProperty(fid, num, name)
% 
% Description :
% -------------
% Creates the VB Script necessary to change object's property.
%
% Parameters :
% ------------
% fid      - file identifier of the HFSS script file.
% num      - the number of objects.
% name     - the name of objects.
% 
% Note :
% ------
%
% Example :
% ---------
% fid = fopen('myantenna.vbs', 'wt');
% ... 
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
% Copyright 2008, Vijay Ramasami (yue_liang423@163.com)
% -------------------------------------------------------------------------
% ---

function    hfssAddproperty(fid, num, name,Value)

% preamble
fprintf(fid, '\n');
fprintf(fid, 'oDesign.ChangeProperty _\n');
fprintf(fid, 'Array("NAME:AllTabs", _\n');
fprintf(fid, 'Array("NAME:LocalVariableTab", _\n');
fprintf(fid, 'Array("NAME:PropServers", _\n');
fprintf(fid,'"LocalVariables"), Array("Name:NewProps",');
for i = 1:num-1
    fprintf(fid, 'Array("NAME:%s", _\n',name{i});
    fprintf(fid,'"PropType:=", "VariableProp", "UserDef:=",true, "Value:=", "%f%s"), _\n',Value{1}(i),Value{2}(i));
end