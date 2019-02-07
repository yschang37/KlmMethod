clear all;
listing = dir('C:\Users\YS\Desktop\SIE511\FinalProject\data\jackie_Exp_HMI\pointing\');
for i =3:8

realFile = convertCharsToStrings([listing(i).folder '\' listing(i).name]);
[file,errmsg]=fopen(realFile);
Dataset=textscan(file,'%s %s %s %s %s %s ');
Dataset{2}=erase(Dataset{2},']');
fclose(file);

j=1;
for k = 1:length(Dataset{1,5})
    if (convertCharsToStrings(Dataset{1,5}{k,1}) == 'BTN_TOUCH') 
    
    colOne(j,1)=str2num(Dataset{1,2}{k,1});
    colTwo(j,1)=convertCharsToStrings(Dataset{1,5}{k,1});
    colThree(j,1)=convertCharsToStrings(Dataset{1,6}{k,1});
    j=j+1;
    end

end
    filename = [listing(i).name '.xlsx'];
    filename = erase(filename,".txt");
    xlswrite(filename,[colOne colTwo colThree]);
        colOne=[];
    colTwo=[];
    colThree=[];
end

