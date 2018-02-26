function hfssCreateRegion(fid,PaddingType,XPad,YPad,ZPad,Units)
%PaddingType = 1,Absolute Offset; XPad = [+XPadding,-XPadding]

if PaddingType == 1
    Type = 'Absolute Offset';
else
    Type = '?'
end
fprintf(fid, '\n');
fprintf(fid, 'oEditor.CreateRegion _\n');
fprintf(fid, 'Array("NAME:RegionParameters", _\n');
fprintf(fid, '"+XPaddingType:=", "%s","+XPadding:=", "%f%s", _\n',Type, XPad(1), Units);
fprintf(fid, '"-XPaddingType:=", "%s","-XPadding:=", "%f%s", _\n',Type, XPad(2), Units);
fprintf(fid, '"+YPaddingType:=", "%s","+YPadding:=", "%f%s", _\n',Type, YPad(1), Units);
fprintf(fid, '"-YPaddingType:=", "%s","-YPadding:=", "%f%s", _\n',Type, YPad(2), Units);
fprintf(fid, '"+ZPaddingType:=", "%s","+ZPadding:=", "%f%s", _\n',Type, ZPad(1), Units);
fprintf(fid, '"-ZPaddingType:=", "%s","-ZPadding:=", "%f%s"), _\n',Type, ZPad(2), Units);
fprintf(fid, 'Array("NAME:Attributes", "Name:=",  "Region", _\n');
fprintf(fid, '"Flags:=", "Wireframe#", "Color:=", "(255 0 0)", "Transparency:=", 0, _\n');
fprintf(fid, '"PartCoordinateSystem:=", "Global", "UDMId:=", "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", _\n');
fprintf(fid, '"SolveInside:=", true) \n');
end


%oEditor.CreateRegion Array("NAME:RegionParameters", 
%"+XPaddingType:=", "Absolute Offset", "+XPadding:=", "25mm", 
%"-XPaddingType:=", "Absolute Offset", "-XPadding:=", "25mm",
%"+YPaddingType:=", "Absolute Offset", "+YPadding:=", "25mm", 
%"-YPaddingType:=",  "Absolute Offset", "-YPadding:=", "25mm", 
% "+ZPaddingType:=", "Absolute Offset", "+ZPadding:=", "25mm", 
%"-ZPaddingType:=", "Absolute Offset", "-ZPadding:=", "25mm"), 
%Array("NAME:Attributes", "Name:=",  "Region",
%   "Flags:=", "Wireframe#", "Color:=", "(255 0 0)", "Transparency:=", 0, "PartCoordinateSystem:=",  _
%  "Global", "UDMId:=", "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _
%  true)

