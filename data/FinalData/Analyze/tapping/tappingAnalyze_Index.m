y=[JackiesHandsize(3), YsHandsize(3),ManHandsize(3),RaymondHandsize(3)];
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
[beta,R,J,CovB,MSE1,ErrorModelInfo] = nlinfit(y,z1,modelfun,beta0,opts);
x3=[6:0.1:9];
y3=beta(1,1)+beta(2,1)*log2(0.75)+beta(3,1)*x3;
y4=beta(1,1)+beta(2,1)*log2(0.75)+beta(3,1)*7.825;

figure(1);
plot(x3,y3);
xlabel({"Left hand index length size",'(tapping)'});
ylabel("time");
saveas(figure(1),'tapping Left hand index length size.png');
%%
y=[JackiesHandsize(4), YsHandsize(4),ManHandsize(4),RaymondHandsize(4)];
% z=[JackiecolOne(1:2:5,1);JackiecolOne(2:2:6,1);YScolOne(1:2:5,1);YScolOne(2:2:6,1);MancolOne(1:2:5,1);MancolOne(2:2:6,1);RaymondcolOne(1:2:5,1);RaymondcolOne(2:2:6,1)];
x1=[6.9,6.7,7.4,7.7];
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
x3=[6:0.1:9];
y3=beta(1,1)+beta(2,1)*log2(0.75)+beta(3,1)*x3;
y5=beta(1,1)+beta(2,1)*log2(0.75)+beta(3,1)*7.85;

figure(2);
plot(x3,y3);
xlabel({"Right hand index length size",'(tapping)'});
ylabel("time");
saveas(figure(2),'tapping Right hand index length size.png');
%%
y=[mean(JackiesHandsize(3:1:4)), mean(YsHandsize(3:1:4)),mean(ManHandsize(3:1:4)),mean(RaymondHandsize(3:1:4))];
% z=[JackiecolOne(1:2:5,1);JackiecolOne(2:2:6,1);YScolOne(1:2:5,1);YScolOne(2:2:6,1);MancolOne(1:2:5,1);MancolOne(2:2:6,1);RaymondcolOne(1:2:5,1);RaymondcolOne(2:2:6,1)];
x1=[6.9,6.7,7.4,7.7];
z1=[mean(JackiecolOne(1:1:6)),mean(YScolOne(1:1:6)),mean(MancolOne(1:1:6)),mean(RaymondcolOne(1:1:6))];
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
x3=[6:0.1:9];
y3=beta(1,1)+beta(2,1)*log2(0.75)+beta(3,1)*x3;
y7=beta(1,1)+beta(2,1)*log2(0.75)+beta(3,1)*mean(JackiesHandsize(3:1:4));
y8=beta(1,1)+beta(2,1)*log2(0.75)+beta(3,1)* mean(YsHandsize(3:1:4));
y9=beta(1,1)+beta(2,1)*log2(0.75)+beta(3,1)*mean(ManHandsize(3:1:4));
y10=beta(1,1)+beta(2,1)*log2(0.75)+beta(3,1)*mean(RaymondHandsize(3:1:4));
figure(3);
plot(x3,y3);
xlabel({"Both hand index length size",'(tapping)'});
ylabel("time");
saveas(figure(3),'tapping Both hand index length size.png');