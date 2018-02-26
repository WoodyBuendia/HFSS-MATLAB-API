% Change LocalVariables range in Optimization
% Example :
% ---------
%hfssAddOptVar(fid, {'length1','length2','length3',...}, [min1, min2, min3...], [max1,max2...],'mm')
%You should Use hfssaddVar to add Variables to design
% Copyright 2016, WoodyBuendia (woodybuendia@gmail.com)
function hfssChangeOptVar(fid, VarList, minList, maxList,Units)
if iscell(VarList) == 0
   error('VarList should be a Cell!')
else
   ListSize = size(VarList);
   if isvector(ListSize) == 0
       error('VarList should be One Dimenson!')
   end
end
VarNum = max(size(VarList));
fpirntf(fid, '\n');
fprintf(fid, 'oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _\n');
fprintf(fid, 'Array("NAME:PropServers",  "LocalVariables"), Array("NAME:ChangedProps", _\n');

for i = 1:VarNum-1
     fprintf(fid, 'Array("NAME:%s", _\n', VarList{i});
     fprintf(fid, 'Array("NAME:Optimization", "Min:=",  "%f%s")), _\n', minList(i), Units);
     fprintf(fid, 'Array("NAME:%s", _\n', VarList(1));
     fprintf(fid, 'Array("NAME:Optimization", "Min:=", "%f%s")), _\n', maxList(i), Units);
end
    fprintf(fid, 'Array("NAME:%s", _\n', VarList{VarNum});
    fprintf(fid, 'Array("NAME:Optimization", "Min:=",  "%f%s")), _\n', minList(VarNum), Units);
    fprintf(fid, 'Array("NAME:%s", _\n', VarList(1));
    fprintf(fid, 'Array("NAME:Optimization", "Min:=", "%f%s"))))) \n', maxList(VarNum), Units);
end
