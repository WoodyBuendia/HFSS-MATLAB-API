
% zzm----------------------------------------------------------------------------
function hfssRegion(fid, Name, x_d,fx_d, y_d,fy_d, z_d,fz_d)

% Cylinder Parameters.
fprintf(fid, '\n');
fprintf(fid, 'oEditor.CreateRegion _\n');
fprintf(fid, 'Array("NAME:RegionParameters", _\n');
fprintf(fid, '"+XPaddingType:=", _\n');
fprintf(fid, '"Percentage Offset", _\n');
fprintf(fid, '"+XPadding:=", "%f", _\n',x_d);

fprintf(fid, '"-XPaddingType:=", _\n');
fprintf(fid, '"Percentage Offset", _\n');
fprintf(fid, '"-XPadding:=", "%f", _\n',fx_d);

fprintf(fid, '"+YPaddingType:=", _\n');
fprintf(fid, '"Percentage Offset", _\n');
fprintf(fid, '"+YPadding:=", "%f", _\n',y_d);

fprintf(fid, '"-YPaddingType:=", _\n');
fprintf(fid, '"Percentage Offset", _\n');
fprintf(fid, '"-YPadding:=", "%f", _\n',fy_d);

fprintf(fid, '"+ZPaddingType:=", _\n');
fprintf(fid, '"Percentage Offset", _\n');
fprintf(fid, '"+ZPadding:=", "%f", _\n',z_d);

fprintf(fid, '"-ZPaddingType:=", _\n');
fprintf(fid, '"Percentage Offset", _\n');
fprintf(fid, '"-ZPadding:=", "%f"), _\n',fz_d);

% Region Properties.
fprintf(fid, 'Array("NAME:Attributes", _\n'); 
fprintf(fid, '"Name:=", "%s", _\n', Name);
fprintf(fid, '"Flags:=", "Wireframe#", _\n');
fprintf(fid, '"Color:=", "(255 0 0)", _\n');
fprintf(fid, '"Transparency:=", 0, _\n');
fprintf(fid, '"PartCoordinateSystem:=", "Global", _\n');
fprintf(fid, '"MaterialName:=", "vacuum" , _\n');
fprintf(fid, '"SolveInside:=", true)\n');
fprintf(fid, '\n');
