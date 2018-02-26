function hfssExportGain(fid, filename,setupName,planeName, freq)

fprintf(fid, '\n');
fprintf(fid, 'Set oModule = oDesign.GetModule("ReportSetup") \n');
fprintf(fid, 'oModule.CreateReport "XY Plot 1", _\n');
fprintf(fid, '"Far Fields", _\n');
fprintf(fid, '"Rectangular Plot", _\n');
fprintf(fid, '"%s : LastAdaptive", _\n',setupName);
fprintf(fid, 'Array("Context:=", "%s"), _\n', planeName);
fprintf(fid, 'Array("Theta:=", _\n');
fprintf(fid, 'Array("All"), _\n');
fprintf(fid, '"Phi:=", Array("All"), _\n');
fprintf(fid, '"Freq:=", Array("%dGHz")), _\n',freq);
fprintf(fid, 'Array("X Component:=", _\n');
fprintf(fid, '"Theta", _\n');
fprintf(fid, '"Y Component:=", Array("dB(GainTotal)")), _\n');
fprintf(fid, 'Array()\n');
fprintf(fid, 'oModule.ExportToFile "XY Plot 1", "I:/zzm/matlab/source/%s.csv"\n',filename);
fprintf(fid, 'oProject.Save');


