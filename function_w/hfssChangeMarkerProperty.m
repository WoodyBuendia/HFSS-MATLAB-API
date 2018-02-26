function hfssChangeMarkerProperty(fid,reportName,markerName,theta)
fprintf(fid,'Set oModule = oDesign.GetModule("ReportSetup") \n');
fprintf(fid,'oModule.ChangeProperty Array("NAME:AllTabs", Array("NAME:Marker", _\n');
fprintf(fid,'Array("NAME:PropServers", "%s:%s"), _\n',reportName,markerName);
fprintf(fid,'Array("NAME:ChangedProps", Array("NAME:Theta", "Value:=", "%d deg")))) \n',theta);
end