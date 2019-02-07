listing = dir('C:\Users\YS\Desktop\SIE511\Project\data\exp_HMI\real\');
i=15;
realFile = convertCharsToStrings([listing(i).folder '\' listing(i).name]);
[file,errmsg]=fopen(realFile);
Dataset=textscan(file,'%s %s %s %s %s %s ');
Dataset{2}=erase(Dataset{2},']');
fclose(file);
% aa=zeros(length(Dataset{1,5}),2);
j=1;
for i = 1:length(Dataset{1,5})
    if (convertCharsToStrings(Dataset{1,5}{i,1}) == 'ABS_MT_POSITION_X') && (convertCharsToStrings(Dataset{1,5}{i+1,1}) == 'ABS_MT_POSITION_Y')
    
    aa(j,1)=str2num(Dataset{1,2}{i,1});
    bb(j,1)=convertCharsToStrings(Dataset{1,5}{i,1});
    j=j+1;
    aa(j,1)=str2num(Dataset{1,2}{i,1});
    bb(j,1)=convertCharsToStrings(Dataset{1,5}{i+1,1});
    j=j+1;
    end
end

filename = ['test' '.xlsx'];
% filename = erase(filename,".txt");
xlswrite(filename,[aa bb]);
