y=[JackiesHandsize(11), YsHandsize(11),ManHandsize(11),RaymondHandsize(11)];%left thumb size
z1=[mean(JackiecolOne(1:2:6)),mean(YScolOne(1:2:6)),mean(MancolOne(1:2:6)),mean(RaymondcolOne(1:2:6))];
%left thumb size time

modelfun = @(b,x)(b(1)+b(2)*log2(6.625)+b(3)*x);%the train model
opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
beta0 = [2;2;2];
[beta,R,J,CovB,MSE1,ErrorModelInfo] = nlinfit(y,z1,modelfun,beta0,opts);
x3=[6:0.1:8];
y3=beta(1,1)+beta(2,1)*log2(6.625)+beta(3,1)*x3;%get the real line from module
y4=beta(1,1)+beta(2,1)*log2(6.625)+beta(3,1)*10.9;%get the real line from module

figure(1);%plot left hand thumb relation to time
plot(x3,y3);
xlabel({"Left hand thumb length size",'(flicking)'});
ylabel("time");
saveas(figure(1),'flicking Left hand thumb length size.png');
%%
y=[JackiesHandsize(12), YsHandsize(12),ManHandsize(12),RaymondHandsize(12)];%right hand thumb
z1=[mean(JackiecolOne(2:2:6)),mean(YScolOne(2:2:6)),mean(MancolOne(2:2:6)),mean(RaymondcolOne(2:2:6))];
%right thumb time 

modelfun = @(b,x)(b(1)+b(2)*log2(6.625)+b(3)*x);%the train model
opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
beta0 = [2;2;2];
[beta,R,J,CovB,MSE2,ErrorModelInfo] = nlinfit(y,z1,modelfun,beta0,opts);
x3=[6:0.1:8];
y3=beta(1,1)+beta(2,1)*log2(6.625)+beta(3,1)*x3;%use the model's parameter to fit
y5=beta(1,1)+beta(2,1)*log2(6.625)+beta(3,1)*10.7;%get the real line from module

figure(2);%plot the right hand index to the time
plot(x3,y3);
xlabel({"Right hand thumb length size",'(flicking)'});
ylabel("time");
saveas(figure(2),'flicking Right hand thumb length size.png');
%%
y=[mean(JackiesHandsize(11:1:12)), mean(YsHandsize(11:1:12)),mean(ManHandsize(11:1:12)),mean(RaymondHandsize(1:1:2))];
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
y6=beta(1,1)+beta(2,1)*log2(6.625)+beta(3,1)*10.8;%get the real line from module

figure(3);%plot both hand thumb mean
plot(x3,y3);
xlabel({"Both hand thumb length size",'(flicking)'});
ylabel("time");
saveas(figure(3),'flicking Both hand thumb length size.png');