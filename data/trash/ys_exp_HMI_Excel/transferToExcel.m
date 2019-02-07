
listing = dir('C:\Users\YS\Desktop\SIE511\Project\data\exp_HMI\real\');

for i = 3:20
% i=3;
realFile = convertCharsToStrings([listing(i).folder '\' listing(i).name]);
[file,errmsg]=fopen(realFile);
Dataset=textscan(file,'%s %s %s %s %s %s ');
Dataset{2}=erase(Dataset{2},']');
fclose(file);
x='tapping1_thumbL';
% listing2 = dir('C:\Users\YS\Desktop\SIE511\Project\data');
filename = [listing(i).name '.xlsx'];
filename = erase(filename,".txt");
xlswrite(filename,[Dataset{1} Dataset{2} Dataset{3} Dataset{4} Dataset{5} Dataset{6} ]);
end