%%
%Dim faceid

%   faceid = oEditor.GetFaceByPosition(Array("NAME:Parameters", _

%   "BodyName:=" "Box1", "XPosition:=", "3.4mm", "YPosition:=, _

%   "2.8mm", "ZPosition:=", "0.4mm"))
% Copyright 2016, WoodyBuendia (woodybuendia@gmail.com)
function faceID = hfssFaceID(fid,BodyName,Position,Units)
fprintf(fid, '\n');
fprintf(fid,'Dim faceid \n');
fprintf(fid, 'faceid = oEditor.GetFaceByPosition(Array("NAME:Parameters", _\n');
fprintf(fid, '"BodyName:=", "%s",_\n', BodyName);
fprintf(fid, '"XPosition:=", "%f%s",_\n', Position(1),Units);
fprintf(fid, '"YPosition:=", "%f%s",_\n', Position(2),Units);
fprintf(fid, '"ZPosition:=", "%f%s"))\n', Position(3),Units);
