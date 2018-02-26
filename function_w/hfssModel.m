function hfssModel(fid, ObjList, state)
fprintf(fid, 'Set oEditor = oDesign.SetActiveEditor("3D Modeler") \n');
fprintf(fid, 'oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Geometry3DAttributeTab", _\n');
fprintf(fid, 'Array("NAME:PropServers",  _\n');
Num = length(ObjList);
for i = 1:Num-1
    fprintf(fid, '"%s", _\n', ObjList{i});
end
fprintf(fid, '"%s"), _\n', ObjList{Num});
fprintf(fid, 'Array("NAME:ChangedProps", Array("NAME:Model", "Value:=",  _\n');
if state == 1
    Model = 'true';
else
    Model = 'false';
    
end
fprintf(fid, '%s)))) \n', Model);
end