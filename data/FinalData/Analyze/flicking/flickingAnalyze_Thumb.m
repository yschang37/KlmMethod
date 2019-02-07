clear all;
listing = dir('C:\Users\YS\Desktop\SIE511\FinalProject\data\FinalData');

for j=1:length([listing.isdir])%know the length of 
    if strfind(listing(j).name,'Jackie_resultOfFlicking.xls')~=0%find the document we want
        filename = convertCharsToStrings([listing(j).folder '\' listing(j).name]);
        [JackiecolOne colTwo colThree] = xlsread(filename);%get the first column number
    end
end
for j=1:length([listing.isdir])%know the length of 
    if strfind(listing(j).name,'YS_resultOfFlicking.xls')~=0%find the document we want
        filename = convertCharsToStrings([listing(j).folder '\' listing(j).name]);
        [YScolOne colTwo colThree] = xlsread(filename);%get the first column number
    end
end
for j=1:length([listing.isdir])%know the length of 
    if strfind(listing(j).name,'Man_resultOfFlicking.xls')~=0%find the document we want
        filename = convertCharsToStrings([listing(j).folder '\' listing(j).name]);
        [MancolOne colTwo colThree] = xlsread(filename);%get the first column number
    end
end
for j=1:length([listing.isdir])%know the length of 
    if strfind(listing(j).name,'Raymond_resultOfFlicking.xls')~=0%find the document we want
        filename = convertCharsToStrings([listing(j).folder '\' listing(j).name]);
        [RaymondcolOne colTwo colThree] = xlsread(filename);%get the first column number
    end
end
%everyone's hand size
JackiesHandsize = [6.9 6.3 6.9 6.9 7.5 7.8 7.9 7.7 5.3 5.4 10 9.5];
YsHandsize = [6.7 6.6 7.8 7.3 8.2 8.1 7.8 7.2 6.3 6.6 11.3 11.4];
ManHandsize = [7.4 7.9 7.6 7.8 8 8 7.4 7.2 6.1 5.9 11 10.5];
RaymondHandsize = [7.7 7.4 9.0 9.4 8.8 8.4 7.9 7.4 6.4 6.1 11.3 11.4];

y=[JackiesHandsize(1), YsHandsize(1),ManHandsize(1),RaymondHandsize(1)];%left thumb size
z1=[mean(JackiecolOne(1:2:6)),mean(YScolOne(1:2:6)),mean(MancolOne(1:2:6)),mean(RaymondcolOne(1:2:6))];
%left thumb size time

modelfun = @(b,x)(b(1)+b(2)*log2(6.625)+b(3)*x);%the train model
opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
beta0 = [2;2;2];
[beta,R,J,CovB,MSE1,ErrorModelInfo] = nlinfit(y,z1,modelfun,beta0,opts);
x3=[6:0.1:8];
y3=beta(1,1)+beta(2,1)*log2(6.625)+beta(3,1)*x3;%get the real line from module
y4=beta(1,1)+beta(2,1)*log2(6.625)+beta(3,1)*7.175;%get the real line from module

figure(1);%plot left hand thumb relation to time
plot(x3,y3);
xlabel({"Left hand thumb length size",'(flicking)'});
ylabel("time");
saveas(figure(1),'flicking Left hand thumb length size.png');
%%
y=[JackiesHandsize(2), YsHandsize(2),ManHandsize(2),RaymondHandsize(2)];%right hand thumb
z1=[mean(JackiecolOne(2:2:6)),mean(YScolOne(2:2:6)),mean(MancolOne(2:2:6)),mean(RaymondcolOne(2:2:6))];
%right thumb time 

modelfun = @(b,x)(b(1)+b(2)*log2(6.625)+b(3)*x);%the train model
opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
beta0 = [2;2;2];
[beta,R,J,CovB,MSE2,ErrorModelInfo] = nlinfit(y,z1,modelfun,beta0,opts);
x3=[6:0.1:8];
y3=beta(1,1)+beta(2,1)*log2(6.625)+beta(3,1)*x3;%use the model's parameter to fit
y5=beta(1,1)+beta(2,1)*log2(6.625)+beta(3,1)*7.05;%get the real line from module

figure(2);%plot the right hand index to the time
plot(x3,y3);
xlabel({"Right hand thumb length size",'(flicking)'});
ylabel("time");
saveas(figure(2),'flicking Right hand thumb length size.png');
%%
y=[mean(JackiesHandsize(1:1:2)), mean(YsHandsize(1:1:2)),mean(ManHandsize(1:1:2)),mean(RaymondHandsize(1:1:2))];
%the mean of the thumb
z1=[mean(JackiecolOne(1:1:6)),mean(YScolOne(1:1:6)),mean(MancolOne(1:1:6)),mean(RaymondcolOne(1:1:6))];
%the mean of the time

modelfun = @(b,x)(b(1)+b(2)*log2(6.625)+b(3)*x);%the train model
opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
beta0 = [2;2;2];
[beta,R,J,CovB,MSE3,ErrorModelInfo] = nlinfit(y,z1,modelfun,beta0,opts);
x3=[6:0.1:8];
y3=beta(1,1)+beta(2,1)*log2(6.625)+beta(3,1)*x3;%use the training model's parameter
y6=beta(1,1)+beta(2,1)*log2(6.625)+beta(3,1)*7.1125;%get the real line from module

figure(3);%plot both hand thumb mean
plot(x3,y3);
xlabel({"Both hand thumb length size",'(flicking)'});
ylabel("time");
saveas(figure(3),'flicking Both hand thumb length size.png');