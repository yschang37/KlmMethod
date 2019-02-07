
%the hand size
y=[JackiesHandsize(11), YsHandsize(11),ManHandsize(11),RaymondHandsize(11)];
z1=[mean(JackiecolOne(1:2:6)),mean(YScolOne(1:2:6)),mean(MancolOne(1:2:6)),mean(RaymondcolOne(1:2:6))];

modelfun = @(b,x)(b(1)+b(2)*log2(0.75)+b(3)*x);
opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
beta0 = [2;2;2];
[beta,R,J,CovB,MSE1,ErrorModelInfo] = nlinfit(y,z1,modelfun,beta0,opts);
x3=[5:0.1:8];
y3=beta(1,1)+beta(2,1)*log2(0.75)+beta(3,1)*x3;

y4=beta(1,1)+beta(2,1)*log2(0.75)+beta(3,1)*10.9;


figure(1);
plot(x3,y3);
xlabel({"Left hand thumb length size",'(tapping)'});
ylabel("time");
saveas(figure(1),'tapping Left hand thumb length size.png');
%%
% x=[handOr;handOr;handOr;handOr];
y=[JackiesHandsize(12), YsHandsize(12),ManHandsize(12),RaymondHandsize(12)];%which hand finger
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

y5=beta(1,1)+beta(2,1)*log2(0.75)+beta(3,1)*10.7;

figure(2);
plot(x3,y3);
xlabel({"Right hand thumb length size",'(tapping)'});
ylabel("time");
saveas(figure(2),'tapping Right hand thumb length size.png');
%%
%the hand size
y=[mean(JackiesHandsize(11:1:12)), mean(YsHandsize(11:1:12)),mean(ManHandsize(11:1:12)),mean(RaymondHandsize(1:1:2))];
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

y6=beta(1,1)+beta(2,1)*log2(0.75)+beta(3,1)*10.8;


figure(3);
plot(x3,y3);
xlabel({"Both hand thumb length size",'(tapping)'});
ylabel("time");
saveas(figure(3),'tapping Both hand thumb length size.png');