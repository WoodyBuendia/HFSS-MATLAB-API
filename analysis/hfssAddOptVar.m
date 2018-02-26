% add LocalVariables to Optimization
% Example :
% ---------
%hfssAddOptVar(fid, {'length1','length2','length3',...})
%You should Use hfssaddVar to add Variables to design
% Copyright 2016, WoodyBuendia (woodybuendia@gmail.com)
function hfssAddOptVar(fid, VarList)
if iscell(VarList) == 0
   error('VarList should be a Cell!')
else
   ListSize = size(VarList);
   if isvector(ListSize) == 0
       error('VarList should be One Dimenson!')
   end
end

VarNum = max(size(VarList));

fprintf(fid, '\n');
fprintf(fid, 'oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _\n');
fprintf(fid, 'Array("NAME:PropServers",  "LocalVariables"), Array("NAME:ChangedProps", _\n');

    for i = 1:VarNum-1
         fprintf(fid, 'Array("NAME:%s", _\n', VarList{i});
         fprintf(fid, 'Array("NAME:Optimization", "Included:=",  true)), _\n');
    end
    fprintf(fid, 'Array("NAME:%s", _\n', VarList{VarNum});
    fprintf(fid, 'Array("NAME:Optimization", "Included:=",  true))))) \n');

end