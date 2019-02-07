y=[JackiesHandsize(3), YsHandsize(3),ManHandsize(3),RaymondHandsize(3)];%the left index
y4=[JackiesHandsize(1), YsHandsize(1),ManHandsize(1),RaymondHandsize(1)];%the left thumb
y=y./y4;
% z=[JackiecolOne(1:2:5,1);JackiecolOne(2:2:6,1);YScolOne(1:2:5,1);YScolOne(2:2:6,1);MancolOne(1:2:5,1);MancolOne(2:2:6,1);RaymondcolOne(1:2:5,1);RaymondcolOne(2:2:6,1)];
x1=[6.9,6.7,7.4,7.7];
z1=[mean(JackiecolOne(1:2:6)),mean(YScolOne(1:2:6)),mean(MancolOne(1:2:6)),mean(RaymondcolOne(1:2:6))];
% color=[1 0 0];
% scatter3(x,y,z,'*');

modelfun = @(b,x)(b(1)+b(2)*log2(7.5)+b(3)*x.^5);
% modelfun = @(b,x)(b(1)+b(2)*exp(-b(3)*x));

opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
beta0 = [2;2;2];
% a=[1:18];
% a=a.';
beta = nlinfit(y,z1,modelfun,beta0,opts);
x3=[1:0.01:1.5];
y3=beta(1,1)+beta(2,1)*log2(7.5)+beta(3,1)*x3.^5;
figure(1);
plot(x3,y3);
xlabel({"Left hand Ratio",'(tapping)'});
ylabel("time");
saveas(figure(1),'tapping Left hand Ratio.png');
%%

y=[JackiesHandsize(4), YsHandsize(4),ManHandsize(4),RaymondHandsize(4)];
y4=[JackiesHandsize(2), YsHandsize(2),ManHandsize(2),RaymondHandsize(2)];
y=y./y4;
% z=[JackiecolOne(1:2:5,1);JackiecolOne(2:2:6,1);YScolOne(1:2:5,1);YScolOne(2:2:6,1);MancolOne(1:2:5,1);MancolOne(2:2:6,1);RaymondcolOne(1:2:5,1);RaymondcolOne(2:2:6,1)];
x1=[6.9,6.7,7.4,7.7];
z1=[mean(JackiecolOne(2:2:6)),mean(YScolOne(2:2:6)),mean(MancolOne(2:2:6)),mean(RaymondcolOne(2:2:6))];
% color=[1 0 0];
% scatter3(x,y,z,'*');

modelfun = @(b,x)(b(1)+b(2)*log2(7.5)+b(3)*x.^5);
% modelfun = @(b,x)(b(1)+b(2)*exp(-b(3)*x));

opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
beta0 = [2;2;2];
% a=[1:18];
% a=a.';
beta = nlinfit(y,z1,modelfun,beta0,opts);
x3=[1:0.01:1.5];
y3=beta(1,1)+beta(2,1)*log2(7.5)+beta(3,1)*x3.^5;
figure(2);
plot(x3,y3);
xlabel({"Right hand Ratio",'(tapping)'});
ylabel("time");
saveas(figure(2),'tapping Right hand Ratio.png');
%%
y=[mean(JackiesHandsize(3:1:4)), mean(YsHandsize(3:1:4)),mean(ManHandsize(3:1:4)),mean(RaymondHandsize(3:1:4))];
y4=[mean(JackiesHandsize(1:1:2)), mean(YsHandsize(1:1:2)),mean(ManHandsize(1:1:2)),mean(RaymondHandsize(1:1:2))];
y=y./y4;
% z=[JackiecolOne(1:2:5,1);JackiecolOne(2:2:6,1);YScolOne(1:2:5,1);YScolOne(2:2:6,1);MancolOne(1:2:5,1);MancolOne(2:2:6,1);RaymondcolOne(1:2:5,1);RaymondcolOne(2:2:6,1)];
x1=[6.9,6.7,7.4,7.7];
z1=[mean(JackiecolOne(1:1:6)),mean(YScolOne(1:1:6)),mean(MancolOne(1:1:6)),mean(RaymondcolOne(1:1:6))];
% color=[1 0 0];
% scatter3(x,y,z,'*');

modelfun = @(b,x)(b(1)+b(2)*log2(7.5)+b(3)*x.^5);
% modelfun = @(b,x)(b(1)+b(2)*exp(-b(3)*x));

opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
beta0 = [2;2;2];
% a=[1:18];
% a=a.';
beta = nlinfit(y,z1,modelfun,beta0,opts);
x3=[1:0.01:1.5];
y3=beta(1,1)+beta(2,1)*log2(7.5)+beta(3,1)*x3.^5;
figure(3);
plot(x3,y3);
xlabel({"Both hand Ratio",'(tapping)'});
ylabel("time");
saveas(figure(3),'tapping Both hand Ratio.png');