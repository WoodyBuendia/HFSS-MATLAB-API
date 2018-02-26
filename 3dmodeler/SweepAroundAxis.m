function SweepAroundAxis(fid,name,Axis,deg)

fprintf(fid, '\n');
fprintf(fid, 'oEditor.SweepAroundAxis Array("NAME:Selections", "Selections:=", "%s", "NewPartsModelFlag:=",  _\n',name);

% Rectangle Parameters.
fprintf(fid, ' "Model"), Array("NAME:AxisSweepParameters", "DraftAngle:=", "0deg", "DraftType:=",  _\n');
fprintf(fid, '"Round", "CheckFaceFaceIntersection:=", false, "SweepAxis:=", "%s", "SweepAngle:=",  _\n',Axis);         
fprintf(fid, '  "%fdeg", "NumOfSegments:=", "0") _\n',deg);




