%CreateEquationCurve
function hfssCreateEquationCurve(fid, Name,XFunc, YFunc, ZFunc, tStrat, tEnd, PointNum)
% fprintf(fid, 'Dim oAnsoftApp \n');
% fprintf(fid, 'Dim oDesktop \n');
% fprintf(fid, 'Dim oProject \n');
% fprintf(fid, 'Dim oDesign \n');
% fprintf(fid, 'Dim oEditor \n');
% fprintf(fid, 'Dim oModule \n');
% fprintf(fid, 'Set oAnsoftApp = CreateObject("AnsoftHfss.HfssScriptInterface") \n');
% fprintf(fid, 'Set oDesktop = oAnsoftApp.GetAppDesktop() \n');
% fprintf(fid, 'oDesktop.RestoreWindow \n');
fprintf(fid, 'Set oEditor = oDesign.SetActiveEditor("3D Modeler") \n');
fprintf(fid, 'oEditor.CreateEquationCurve Array(');
fprintf(fid, '"NAME:EquationBasedCurveParameters", "XtFunction:=", "%s", _\n', XFunc);
fprintf(fid, '"YtFunction:=", "%s", _\n', YFunc);
fprintf(fid, '"ZtFunction:=", "%s", _\n', ZFunc);
if isnumeric(tStrat)
    fprintf(fid, '"tStart:=", "%f", _\n', tStrat);
else
    fprintf(fid, '"tStart:=", "%s", _\n', tStrat);
end

if isnumeric(tEnd)
    fprintf(fid, '"tEnd:=", "%f", _\n', tEnd);
else
    fprintf(fid, '"tEnd:=", "%s", _\n', tEnd);
end

if isnumeric(PointNum)
    fprintf(fid, '"NumOfPointsOnCurve:=", "%f", _\n', PointNum);
else
    fprintf(fid, '"NumOfPointsOnCurve:=", "%s", _\n', PointNum);
end

fprintf(fid, '"Version:=", 1, _\n');
fprintf(fid, 'Array("NAME:PolylineXSection", "XSectionType:=", "None", "XSectionOrient:=", "Auto", "XSectionWidth:=", "0", "XSectionTopWidth:=",  "0", "XSectionHeight:=", "0", "XSectionNumSegments:=", "0", "XSectionBendType:=",  "Corner")), _\n');
fprintf(fid, 'Array("NAME:Attributes", "Name:=", "%s", "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", "UDMId:=",  "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=", true)',Name);


