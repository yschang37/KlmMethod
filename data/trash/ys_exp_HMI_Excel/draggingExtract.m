listing = dir('C:\Users\YS\Desktop\SIE511\Project\data\ys_Exp_HMI\dragging\');
i=3;
realFile = convertCharsToStrings([listing(i).folder '\' listing(i).name]);
[file,errmsg]=fopen(realFile);
Dataset=textscan(file,'%s %s %s %s %s %s ');
Dataset{2}=erase(Dataset{2},']');
fclose(file);

j=1;
for i = 1:length(Dataset{1,5})
    if (convertCharsToStrings(Dataset{1,5}{i,1}) == 'BTN_TOUCH') 
    
    aa(j,1)=str2num(Dataset{1,2}{i,1});
    bb(j,1)=convertCharsToStrings(Dataset{1,5}{i,1});
    j=j+1;
    aa(j,1)=str2num(Dataset{1,2}{i,1});
    bb(j,1)=convertCharsToStrings(Dataset{1,5}{i+1,1});
    j=j+1;
    end
end

filename = [listing(i).name '.xlsx'];
filename = erase(filename,".txt");
xlswrite(filename,[aa bb]);
