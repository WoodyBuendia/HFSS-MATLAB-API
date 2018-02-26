function hfssExportImageToFile(fid,reportName,filepath)
fprintf(fid,'Set oModule = oDesign.GetModule("ReportSetup") \n');
fprintf(fid,'oModule.ExportImageToFile "%s",  _\n',reportName);
fprintf(fid,'"%s", 0, 0 \n',filepath);
