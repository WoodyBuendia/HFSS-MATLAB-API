Dim oAnsoftApp 
Dim oDesktop 
Dim oProject 
Dim oDesign 
Dim oEditor 
Dim oDesign 
Dim oModule 
Set oAnsoftApp = CreateObject("Ansoft.ElectronicsDesktop"Set oDesktop = oAnsoftApp.GetAppDesktop()Set oProject = oDesktop.SetActiveProject("3DArray1516")Set oDesign = oProject.SetActiveDesign("1516")
Set oEditor = oDesign.SetActiveEditor("3D Modeler") 
oEditor.SetWCS Array("NAME:SetWCS Parameter", _
"Working Coordinate System:=", "Global")

Set oModule = oDesign.GetModule("Solutions") 
oModule.EditSources "TotalFields", _
Array("NAME:Names", _
"R1", _
"L1", _
"R2", _
"L2", _
"R3", _
"L3", _
"R4", _
"L4", _
"R5", _
"L5", _
"R6", _
"L6", _
"R7", _
"L7", _
"R8", _
"L8", _
"R9", _
"L9", _
"R10", _
"L10", _
"R11", _
"L11", _
"R12", _
"L12", _
"R13", _
"L13", _
"R14", _
"L14", _
"R15", _
"L15", _
"R16", _
"L16", _
"R17", _
"L17"), Array("NAME:Modes", _
1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1), Array("NAME:Magnitudes", _
"0.000000w", "0.000000w", "0.000000w", "1.000000w", "0.000000w", "1.000000w", "0.000000w", "1.000000w", "0.000000w", "0.000000w", "0.000000w", "0.000000w", "0.000000w", "0.000000w", "0.000000w", "1.000000w", "0.000000w", "1.000000w", "0.000000w", "1.000000w", "0.000000w", "1.000000w", "0.000000w", "1.000000w", "0.000000w", "0.000000w", "0.000000w", "0.000000w", "0.000000w", "0.000000w", "0.000000w", "0.000000w", "0.000000w", "1.000000w"), Array("NAME:Phases", _
"0.000000deg", "0.000000deg", "0.000000deg", "-162.701682deg", "0.000000deg", "-120.068736deg", "0.000000deg", "42.857250deg", "0.000000deg", "0.000000deg", "0.000000deg", "0.000000deg", "0.000000deg", "0.000000deg", "0.000000deg", "12.893360deg", "0.000000deg", "-96.334126deg", "0.000000deg", "91.035123deg", "0.000000deg", "126.829958deg", "0.000000deg", "-25.387660deg", "0.000000deg", "0.000000deg", "0.000000deg", "0.000000deg", "0.000000deg", "0.000000deg", "0.000000deg", "0.000000deg", "0.000000deg", "-128.721336deg"), Array("NAME:Terminated"), _
Array("NAME:Impedances"), _
  false, false,false,"1W"
oModule.ExportToFile _
"15Lphi15", _
"D:\woody\MATLAB\matlabHFSSApi\hfssapi\function_w\result\15L_85_15.csv" 

Set oEditor = oDesign.SetActiveEditor("3D Modeler") 
oEditor.SetWCS Array("NAME:SetWCS Parameter", _
"Working Coordinate System:=", "Global")

Set oModule = oDesign.GetModule("Solutions") 
oModule.EditSources "TotalFields", _
Array("NAME:Names", _
"R1", _
"L1", _
"R2", _
"L2", _
"R3", _
"L3", _
"R4", _
"L4", _
"R5", _
"L5", _
"R6", _
"L6", _
"R7", _
"L7", _
"R8", _
"L8", _
"R9", _
"L9", _
"R10", _
"L10", _
"R11", _
"L11", _
"R12", _
"L12", _
"R13", _
"L13", _
"R14", _
"L14", _
"R15", _
"L15", _
"R16", _
"L16", _
"R17", _
"L17"), Array("NAME:Modes", _
1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1), Array("NAME:Magnitudes", _
"0.000000w", "0.000000w", "0.000000w", "1.000000w", "0.000000w", "1.000000w", "0.000000w", "1.000000w", "0.000000w", "0.000000w", "0.000000w", "0.000000w", "0.000000w", "0.000000w", "0.000000w", "1.000000w", "0.000000w", "1.000000w", "0.000000w", "1.000000w", "0.000000w", "1.000000w", "0.000000w", "1.000000w", "0.000000w", "0.000000w", "0.000000w", "0.000000w", "0.000000w", "0.000000w", "0.000000w", "0.000000w", "0.000000w", "1.000000w"), Array("NAME:Phases", _
"0.000000deg", "0.000000deg", "0.000000deg", "-162.701682deg", "0.000000deg", "-120.068736deg", "0.000000deg", "42.857250deg", "0.000000deg", "0.000000deg", "0.000000deg", "0.000000deg", "0.000000deg", "0.000000deg", "0.000000deg", "12.893360deg", "0.000000deg", "-96.334126deg", "0.000000deg", "91.035123deg", "0.000000deg", "126.829958deg", "0.000000deg", "-25.387660deg", "0.000000deg", "0.000000deg", "0.000000deg", "0.000000deg", "0.000000deg", "0.000000deg", "0.000000deg", "0.000000deg", "0.000000deg", "-128.721336deg"), Array("NAME:Terminated"), _
Array("NAME:Impedances"), _
  false, false,false,"1W"
oModule.ExportToFile _
"15Lphi15", _
"D:\woody\MATLAB\matlabHFSSApi\hfssapi\function_w\result\15L_85_15.csv" 
Set oModule = oDesign.GetModule("ReportSetup") 
oModule.ChangeProperty Array("NAME:AllTabs", Array("NAME:Marker", _
Array("NAME:PropServers", "15Lphi15:m1"), _
Array("NAME:ChangedProps", Array("NAME:Theta", "Value:=", "85 deg")))) 

Set oEditor = oDesign.SetActiveEditor("3D Modeler") 
oEditor.SetWCS Array("NAME:SetWCS Parameter", _
"Working Coordinate System:=", "Global")

Set oModule = oDesign.GetModule("Solutions") 
oModule.EditSources "TotalFields", _
Array("NAME:Names", _
"R1", _
"L1", _
"R2", _
"L2", _
"R3", _
"L3", _
"R4", _
"L4", _
"R5", _
"L5", _
"R6", _
"L6", _
"R7", _
"L7", _
"R8", _
"L8", _
"R9", _
"L9", _
"R10", _
"L10", _
"R11", _
"L11", _
"R12", _
"L12", _
"R13", _
"L13", _
"R14", _
"L14", _
"R15", _
"L15", _
"R16", _
"L16", _
"R17", _
"L17"), Array("NAME:Modes", _
1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1), Array("NAME:Magnitudes", _
"0.000000w", "0.000000w", "0.000000w", "1.000000w", "0.000000w", "1.000000w", "0.000000w", "1.000000w", "0.000000w", "0.000000w", "0.000000w", "0.000000w", "0.000000w", "0.000000w", "0.000000w", "1.000000w", "0.000000w", "1.000000w", "0.000000w", "1.000000w", "0.000000w", "1.000000w", "0.000000w", "1.000000w", "0.000000w", "0.000000w", "0.000000w", "0.000000w", "0.000000w", "0.000000w", "0.000000w", "0.000000w", "0.000000w", "1.000000w"), Array("NAME:Phases", _
"0.000000deg", "0.000000deg", "0.000000deg", "-162.701682deg", "0.000000deg", "-120.068736deg", "0.000000deg", "42.857250deg", "0.000000deg", "0.000000deg", "0.000000deg", "0.000000deg", "0.000000deg", "0.000000deg", "0.000000deg", "12.893360deg", "0.000000deg", "-96.334126deg", "0.000000deg", "91.035123deg", "0.000000deg", "126.829958deg", "0.000000deg", "-25.387660deg", "0.000000deg", "0.000000deg", "0.000000deg", "0.000000deg", "0.000000deg", "0.000000deg", "0.000000deg", "0.000000deg", "0.000000deg", "-128.721336deg"), Array("NAME:Terminated"), _
Array("NAME:Impedances"), _
  false, false,false,"1W"
oModule.ExportToFile _
"15Lphi15", _
"D:\woody\MATLAB\matlabHFSSApi\hfssapi\function_w\result\15L_85_15.csv" 
Set oModule = oDesign.GetModule("ReportSetup") 
oModule.ChangeProperty Array("NAME:AllTabs", Array("NAME:Marker", _
Array("NAME:PropServers", "15Lphi15:m1"), _
Array("NAME:ChangedProps", Array("NAME:Theta", "Value:=", "85 deg")))) 
Set oModule = oDesign.GetModule("ReportSetup") 
oModule.ExportImageToFile "15Lphi15",  _
"D:\woody\MATLAB\matlabHFSSApi\hfssapi\function_w\result\15L_85_15.bmp", 0, 0 
