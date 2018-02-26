
  %oEditor.CreateHelix 
  %Array("NAME:Selections", "Selections:=", "Circle1", "NewPartsModelFlag:=",  _
  %"Model"), Array("NAME:HelixParameters", "XCenter:=", "0mm", "YCenter:=", "0mm", "ZCenter:=",  _
  %"0mm", "XStartDir:=", "0mm", "YStartDir:=", "0mm", "ZStartDir:=", "1mm", "NumThread:=",  _
  %"2", "RightHand:=", true, "RadiusIncrement:=", "0mm", "Thread:=", "50mm")
  %%
function hfssHelix(fid, Name, Center, StartDir, Turns,RightHand, RadiusIncrement, Thread, Units)
Center = reshape(Center, length(Center), 1);

if iscell(Center)
    1;
else
    Center = mat2cell(Center,[1,1,1],1);
end

StartDir = reshape( StartDir, length( StartDir), 1);

if iscell(StartDir)
    1;
else
    StartDir = mat2cell(StartDir,[1,1,1],1);
end

fprintf(fid, '\n');
fprintf(fid, 'oEditor.CreateHelix _\n');
fprintf(fid, 'Array("NAME:Selections", _\n');
fprintf(fid, '"Selections:=", "%s",_\n',Name);
fprintf(fid, '"NewPartsModelFlag:=","Model"),_\n ');
fprintf(fid, 'Array("NAME:HelixParameters", _\n ');
%Center
if isnumeric(Center{1,1})
    fprintf(fid, '"XCenter:=", "%f%s", _\n', Center{1,1}, Units);
else
    fprintf(fid, '"XCenter:=", "%s", _\n', Center{1,1});
end
    
if isnumeric(Center{2,1})
    fprintf(fid, '"YCenter:=", "%f%s", _\n', Center{2,1}, Units);
else
    fprintf(fid, '"YCenter:=", "%s", _\n', Center{2,1});
end
  
if isnumeric(Center{3,1})
   fprintf(fid, '"ZCenter:=", "%f%s", _\n', Center{3,1}, Units);
else
     fprintf(fid, '"ZCenter:=", "%s", _\n', Center{3,1});
end
%StartDir
if isnumeric(StartDir{1,1})
    fprintf(fid, '"XStartDir:=", "%f%s", _\n', StartDir{1,1}, Units);
else
    fprintf(fid, '"XStartDir:=", "%s", _\n', StartDir{1,1});
end
    
if isnumeric(StartDir{2,1})
    fprintf(fid, '"YStartDir:=", "%f%s", _\n', StartDir{2,1}, Units);
else
    fprintf(fid, '"YStartDir:=", "%s", _\n', StartDir{2,1});
end
  
if isnumeric(StartDir{3,1})
   fprintf(fid, '"ZStartDir:=", "%f%s", _\n', StartDir{3,1}, Units);
else
     fprintf(fid, '"ZStartDir:=", "%s", _\n', StartDir{3,1});
end
%NumThread
fprintf(fid, '"NumThread:=", "%f", _\n', Turns);
%If RightHand
if RightHand == 1
    fprintf(fid, '"RightHand:=", true, _\n ');
else
    fprintf(fid, '"RightHand:=", false, _\n ');
end
%RadiusIncrement
fprintf(fid, '"RadiusIncrement:=", "%f%s", _\n', RadiusIncrement, Units);
%Thread
if isnumeric(Thread)
    fprintf(fid, '"Thread:=", "%f%s")', Thread, Units);
else
    fprintf(fid, '"Thread:=", "%s")', Thread);
end
%%
%fprintf(fid, '\n');
%fprintf(fid, 'oEditor.CreateHelix _\n');
%fprintf(fid, 'Array("NAME:Selections", _\n');
%fprintf(fid, '"Selections:=", "%s",_\n',Name);
%fprintf(fid, '"NewPartsModelFlag:=","Model"),_\n ');
%fprintf(fid, 'Array("NAME:HelixParameters", _\n ');
%Center
%fprintf(fid, '"XCenter:=", "%f%s", _\n', Center(1), Units);
%fprintf(fid, '"YCenter:=", "%f%s", _\n', Center(2), Units);
%fprintf(fid, '"ZCenter:=", "%f%s", _\n', Center(3), Units);
%StartDir
%fprintf(fid, '"XStartDir:=", "%f%s", _\n', StartDir(1), Units);
%fprintf(fid, '"YStartDir:=", "%f%s", _\n', StartDir(2), Units);
%fprintf(fid, '"ZStartDir:=", "%f%s", _\n', StartDir(3), Units);
%NumThread
%fprintf(fid, '"NumThread:=", "%f", _\n', Turns);
%If RightHand
%if RightHand == 1
%    fprintf(fid, '"RightHand:=", true, _\n ');
%else
%    fprintf(fid, '"RightHand:=", false, _\n ');
%end
%RadiusIncrement
%fprintf(fid, '"RadiusIncrement:=", "%f%s", _\n', RadiusIncrement, Units);
%Thread
%fprintf(fid, '"Thread:=", "%f%s")', Thread, Units);