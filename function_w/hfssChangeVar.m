% function hfssChangeVar(fid,VarName,Vaule,Units)
% change vaule LocalVariable
% only one Variable can be add once
% Copyright 2016, WoodyBuendia (woodybuendia@gmail.com)
function hfssChangeVar(fid,VarName,Vaule,Units)
fprintf(fid, '\n');
fprintf(fid, 'oDesign.ChangeProperty _\n');
fprintf(fid, 'Array("NAME:AllTabs", _\n');
fprintf(fid, 'Array("NAME:LocalVariableTab", _\n');
fprintf(fid, 'Array("NAME:PropServers","LocalVariables"),  _\n');
fprintf(fid, 'Array("NAME:ChangedProps", _\n');
fprintf(fid, 'Array("NAME:%s", "Value:=", "%d%s")))) \n', VarName, Vaule, Units);
end