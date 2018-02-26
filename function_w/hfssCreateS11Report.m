function hfssCreateS11Report(fid, ReportName, NominalVarList, OptVarList, VarValue, Units)
fprintf(fid, '\n');
fprintf(fid, 'Set oModule = oDesign.GetModule("ReportSetup") \n');
fprintf(fid, 'oModule.CreateReport "%s", "Modal Solution Data", _\n', ReportName);
fprintf(fid, '"Rectangular Plot", "solve : sweep1", Array("Domain:=", "Sweep"),  _\n');
fprintf(fid,'Array( _\n');
fprintf(fid, '"Freq:=", Array("All"), _\n');

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



fprintf(fid, 'Array("X Component:=", "Freq", "Y Component:=", Array( "dB(S(p1,p1))")), Array()');
end