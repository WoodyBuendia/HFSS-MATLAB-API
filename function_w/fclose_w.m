% Copyright 2016, WoodyBuendia (woodybuendia@gmail.com)
function fclose_w(fid)
status = fclose(fid);
if status == 0
    disp('VSB file closed')
else
    disp('VSB file closed fail')
    status = fclose('all');
    if status == 0
        disp('ALL file closed')
    else
        disp('Plz manually close MATLAB')
    end
end
disp('Sctrip Completed')