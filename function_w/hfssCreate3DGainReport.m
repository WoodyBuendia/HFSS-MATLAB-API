function hfssCreate3DGainReport(fid, ReportName, VarList, Geometry, f)
fprintf(fid, '\n');
fprintf(fid, 'Set oModule = oDesign.GetModule("ReportSetup") \n');
fprintf(fid, 'oModule.CreateReport "%s", "Far Fields", _\n', ReportName);
fprintf(fid, '"3D Polar Plot", "Setup1 : LastAdaptive", _\n');
fprintf(fid, 'Array("Context:=", "%s"), _\n', Geometry);
fprintf(fid,'Array("Theta:=", Array("All"), "Phi:=", Array("All"), _\n');
fprintf(fid, '"Freq:=", Array("%dGHz")', f);
if length(VarList) >= 1
    fprintf(fid, ', _\n');
    for i = 1:length(VarList)
    fprintf(fid, '"%s:=", Array( "Nominal")', VarList{i});
    if i ~= length(VarList)
        fprintf(fid, ', _\n');
    else
        fprintf(fid, '), _\n');
    end
    end
else
    fprintf(fid, '), _\n');
end

fprintf(fid, 'Array("Phi Component:=", "Phi", "Theta Component:=", "Theta", "Mag Component:=", Array("dB(GainTotal)")), Array()');
end