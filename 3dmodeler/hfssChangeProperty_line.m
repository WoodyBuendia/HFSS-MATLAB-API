% ----------------------------------------------------------------------------
% function hfssChangeProperty(fid, num,first,pro)
% 
% Description :
% -------------
% Creates the VB Script necessary to change line's property.
%
% Parameters :
% ------------
% fid      - file identifier of the HFSS script file.
% num      - the number of points.
% first    - the first point first(x,y,z). include the units char
% pro      - 2tonum point pro{num}(x,y,z). include the units char
% Note :
% ------
%
% This file is part of HFSS-MATLAB-API.
%
% Copyright 2016, ZZM 
% -------------------------------------------------------------------------
% ---

function    hfssChangeProperty_line(fid, num,first,pro)

% preamble
fprintf(fid, '\n');

fprintf(fid, 'oEditor.ChangeProperty _\n');
fprintf(fid, 'Array("NAME:AllTabs", _\n');
fprintf(fid, 'Array("NAME:Geometry3DPolylineTab", _\n');
fprintf(fid, 'Array("NAME:PropServers", _\n');
fprintf(fid,'"Polyline1:CreatePolyline:2:Segment0"), Array("Name:NewProps",');
fprintf(fid, 'Array("NAME:ChangedProps", Array("Name:Point1", "X:=","%s","Y:=", "%s","Z:=", "%s"), _\n',first(1),first(2),first(3));
fprintf(fid, 'Array("NAME:ChangedProps", Array("Name:Point2", "X:=","%s","Y:=", "%s","Z:=", "%s")))), _\n',pro{1}(1),pro{1}(2),pro{1}(3));
for i = 2:num-1
fprintf(fid, 'oEditor.ChangeProperty _\n');
fprintf(fid, 'Array("NAME:AllTabs", _\n');
fprintf(fid, 'Array("NAME:Geometry3DPolylineTab", _\n');
fprintf(fid, 'Array("NAME:PropServers", _\n');
fprintf(fid,'"Polyline1:CreatePolyline:2:Segment%d"), Array("Name:NewProps",',i-1);
fprintf(fid, 'Array("NAME:ChangedProps", Array("Name:Point2", "X:=","%s","Y:=", "%s","Z:=", "%s")))), _\n',pro{1}(1),pro{1}(2),pro{1}(3));   
fprintf(fid,'"PropType:=", "VariableProp", "UserDef:=",true, "Value:=", "%f%s")))), _\n',Value(i),Units);
end