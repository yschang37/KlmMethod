clear all;
listing = dir('C:\Users\YS\Desktop\SIE511\FinalProject\data\FinalData');

for j=1:length([listing.isdir])%know the length of 
    if strfind(listing(j).name,'Jackie_resultOfTapping.xls')~=0%find the document we want
        filename = convertCharsToStrings([listing(j).folder '\' listing(j).name]);
        [JackiecolOne colTwo colThree] = xlsread(filename);%get the first column number
    end
end
for j=1:length([listing.isdir])%know the length of 
    if strfind(listing(j).name,'YS_resultOfTapping.xls')~=0%find the document we want
        filename = convertCharsToStrings([listing(j).folder '\' listing(j).name]);
        [YScolOne colTwo colThree] = xlsread(filename);%get the first column number
    end
end
for j=1:length([listing.isdir])%know the length of 
    if strfind(listing(j).name,'Man_resultOfTapping.xls')~=0%find the document we want
        filename = convertCharsToStrings([listing(j).folder '\' listing(j).name]);
        [MancolOne colTwo colThree] = xlsread(filename);%get the first column number
    end
end
for j=1:length([listing.isdir])%know the length of 
    if strfind(listing(j).name,'Raymond_resultOfTapping.xls')~=0%find the document we want
        filename = convertCharsToStrings([listing(j).folder '\' listing(j).name]);
        [RaymondcolOne colTwo colThree] = xlsread(filename);%get the first column number
    end
end
%everyone's hand size
JackiesHandsize = [6.9 6.3 6.9 6.9 7.5 7.8 7.9 7.7 5.3 5.4 10 9.5];
YsHandsize = [6.7 6.6 7.8 7.3 8.2 8.1 7.8 7.2 6.3 6.6 11.3 11.4];
ManHandsize = [7.4 7.9 7.6 7.8 8 8 7.4 7.2 6.1 5.9 11 10.5];
RaymondHandsize = [7.7 7.4 9.0 9.4 8.8 8.4 7.9 7.4 6.4 6.1 11.3 11.4];


%the hand size
y=[JackiesHandsize(1), YsHandsize(1),ManHandsize(1),RaymondHandsize(1)];
z1=[mean(JackiecolOne(1:2:6)),mean(YScolOne(1:2:6)),mean(MancolOne(1:2:6)),mean(RaymondcolOne(1:2:6))];

modelfun = @(b,x)(b(1)+b(2)*log2(0.75)+b(3)*x);
opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
beta0 = [2;2;2];
% beta = nlinfit(y,z1,modelfun,beta0,opts);
[beta,R,J,CovB,MSE1,ErrorModelInfo] = nlinfit(y,z1,modelfun,beta0,opts);
x3=[5:0.1:8];
y3=beta(1,1)+beta(2,1)*log2(0.75)+beta(3,1)*x3;

y4=beta(1,1)+beta(2,1)*log2(0.75)+beta(3,1)*7.175;


figure(1);
plot(x3,y3);
xlabel({"Left hand thumb length size",'(tapping)'});
ylabel("time");
saveas(figure(1),'tapping Left hand thumb length size.png');
%%
% x=[handOr;handOr;handOr;handOr];
y=[JackiesHandsize(2), YsHandsize(2),ManHandsize(2),RaymondHandsize(2)];%which hand finger
% z=[JackiecolOne(1:2:5,1);JackiecolOne(2:2:6,1);YScolOne(1:2:5,1);YScolOne(2:2:6,1);MancolOne(1:2:5,1);MancolOne(2:2:6,1);RaymondcolOne(1:2:5,1);RaymondcolOne(2:2:6,1)];
x1=[6.3,6.7,7.9,7.4];
z1=[mean(JackiecolOne(2:2:6)),mean(YScolOne(2:2:6)),mean(MancolOne(2:2:6)),mean(RaymondcolOne(2:2:6))];
% color=[1 0 0];
% scatter3(x,y,z,'*');

modelfun = @(b,x)(b(1)+b(2)*log2(0.75)+b(3)*x);
% modelfun = @(b,x)(b(1)+b(2)*exp(-b(3)*x));

opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
beta0 = [2;2;2];
% a=[1:18];
% a=a.';
[beta,R,J,CovB,MSE2,ErrorModelInfo] = nlinfit(y,z1,modelfun,beta0,opts);
x3=[5:0.1:8];
y3=beta(1,1)+beta(2,1)*log2(0.75)+beta(3,1)*x3;

y5=beta(1,1)+beta(2,1)*log2(0.75)+beta(3,1)*7.05;

figure(2);
plot(x3,y3);
xlabel({"Right hand thumb length size",'(tapping)'});
ylabel("time");
saveas(figure(2),'tapping Right hand thumb length size.png');
%%
%the hand size
y=[mean(JackiesHandsize(1:1:2)), mean(YsHandsize(1:1:2)),mean(ManHandsize(1:1:2)),mean(RaymondHandsize(1:1:2))];
% z=[JackiecolOne(1:2:5,1);JackiecolOne(2:2:6,1);YScolOne(1:2:5,1);YScolOne(2:2:6,1);MancolOne(1:2:5,1);MancolOne(2:2:6,1);RaymondcolOne(1:2:5,1);RaymondcolOne(2:2:6,1)];
x1=[6.9,6.7,7.4,7.7];
z1=[mean(JackiecolOne(1:2:6)),mean(YScolOne(1:2:6)),mean(MancolOne(1:2:6)),mean(RaymondcolOne(1:2:6))];
% color=[1 0 0];
% scatter3(x,y,z,'*');

modelfun = @(b,x)(b(1)+b(2)*log2(0.75)+b(3)*x);
% modelfun = @(b,x)(b(1)+b(2)*exp(-b(3)*x));

opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
beta0 = [2;2;2];
% a=[1:18];
% a=a.';
[beta,R,J,CovB,MSE3,ErrorModelInfo] = nlinfit(y,z1,modelfun,beta0,opts);
x3=[5:0.1:8];
y3=beta(1,1)+beta(2,1)*log2(0.75)+beta(3,1)*x3;

y6=beta(1,1)+beta(2,1)*log2(0.75)+beta(3,1)*7.1125;
y7=beta(1,1)+beta(2,1)*log2(0.75)+beta(3,1)*mean(JackiesHandsize(1:1:2));
y8=beta(1,1)+beta(2,1)*log2(0.75)+beta(3,1)* mean(YsHandsize(1:1:2));
y9=beta(1,1)+beta(2,1)*log2(0.75)+beta(3,1)*mean(ManHandsize(1:1:2));
y10=beta(1,1)+beta(2,1)*log2(0.75)+beta(3,1)*mean(RaymondHandsize(1:1:2));

figure(3);
plot(x3,y3);
xlabel({"Both hand thumb length size",'(tapping)'});
ylabel("time");
saveas(figure(3),'tapping Both hand thumb length size.png');