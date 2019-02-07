clear all;
listing = dir('C:\Users\YS\Desktop\SIE511\FinalProject\data\jackie_Exp_HMI\flicking');
k=1;

for j=1:length([listing.isdir])%know the length of 
    if strfind(listing(j).name,'.xlsx')~=0%find the document we want
        filename = convertCharsToStrings([listing(j).folder '\' listing(j).name]);
        [colOne colTwo colThree] = xlsread(filename);%get the first column number
        
        for i=1:length(colOne)
            if mod(i,2)==0
                eachAvg(i/2,1)=(colOne(i)-colOne(i-1));
            end
        end
        
        sumResult = sum(eachAvg);
        resultAvg = sumResult/length(eachAvg);
        resultOfFilename(k,1) = filename;
        resultOfAvg(k,1) = resultAvg;
        k = k+1;
    end

end
xlswrite('Jackie_resultOfFlicking',[resultOfFilename resultOfAvg]);


