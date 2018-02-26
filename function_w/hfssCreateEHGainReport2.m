function hfssCreateEHGainReport2(fid, ReportName, NominalVarList, OptVarList, VarValue, Geometry, f,Units)
fprintf(fid, '\n');
fprintf(fid, 'Set oModule = oDesign.GetModule("ReportSetup") \n');
fprintf(fid, 'oModule.CreateReport "%s", "Far Fields", _\n', ReportName);
fprintf(fid, '"Rectangular Plot", "solve : LastAdaptive", _\n');
fprintf(fid, 'Array("Context:=", "%s"), _\n', Geometry);
fprintf(fid,'Array("Theta:=", Array("All"), "Phi:=", Array("All"), _\n');
fprintf(fid, '"Freq:=", Array("%dGHz"), _\n', f);

for i = 1:length(NominalVarList)

    fprintf(fid, '"%s:=", Array( "Nominal"), _\n', NominalVarList{i});

end



for i = 1:length(OptVarList)
    fprintf(fid, '"%s:=", Array( ', cell2mat(OptVarList{i}));
    clearvars temp
    temp = VarValue{i};
    for j = 1:length(temp)-1
        fprintf(fid, '"%.15f%s",',temp(j),Units);
    end
    fprintf(fid, '"%.15f%s")',temp(length(temp)),Units);
    if i ~= length(OptVarList)
        fprintf(fid, ', _\n');
    else
        fprintf(fid, '), _\n');
    end
    
end



fprintf(fid, 'Array("X Component:=", "Theta", "Y Component:=", Array("dB(GainTotal)")), Array()');
end