y=[JackiesHandsize(9), YsHandsize(9),ManHandsize(9),RaymondHandsize(9)];
%the left hand index
z1=[mean(JackiecolOne(1:2:6)),mean(YScolOne(1:2:6)),mean(MancolOne(1:2:6)),mean(RaymondcolOne(1:2:6))];
%left thumb size time

modelfun = @(b,x)(b(1)+b(2)*log2(6.625)+b(3)*x);%the train model
opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
beta0 = [2;2;2];
[beta,R,J,CovB,MSE1,ErrorModelInfo] = nlinfit(y,z1,modelfun,beta0,opts);
x3=[6:0.1:10];
y3=beta(1,1)+beta(2,1)*log2(6.625)+beta(3,1)*x3;%get the real line from module
y4=beta(1,1)+beta(2,1)*log2(6.625)+beta(3,1)*6.025;%get the real line from module

figure(1);%plot left hand thumb relation to time
plot(x3,y3);
xlabel({"Left hand index length size",'(flicking)'});
ylabel("time");
saveas(figure(1),'flicking Left hand index length size.png');
%%
y=[JackiesHandsize(10), YsHandsize(10),ManHandsize(10),RaymondHandsize(10)];
%right hand index
z1=[mean(JackiecolOne(2:2:6)),mean(YScolOne(2:2:6)),mean(MancolOne(2:2:6)),mean(RaymondcolOne(2:2:6))];
%right thumb time 

modelfun = @(b,x)(b(1)+b(2)*log2(6.625)+b(3)*x);%the train model
opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
beta0 = [2;2;2];
[beta,R,J,CovB,MSE2,ErrorModelInfo] = nlinfit(y,z1,modelfun,beta0,opts);
x3=[6:0.1:10];
y3=beta(1,1)+beta(2,1)*log2(6.625)+beta(3,1)*x3;%use the model's parameter to fit
y5=beta(1,1)+beta(2,1)*log2(6.625)+beta(3,1)*6;%get the real line from module

figure(2);%plot the right hand index to the time
plot(x3,y3);
xlabel({"Right hand index length size",'(flicking)'});
ylabel("time");
saveas(figure(1),'flicking Right hand index length size.png');
%%
y=[mean(JackiesHandsize(9:1:10)), mean(YsHandsize(9:1:10)),mean(ManHandsize(9:1:10)),mean(RaymondHandsize(9:1:10))];
%the mean of the index
z1=[mean(JackiecolOne(1:1:6)),mean(YScolOne(1:1:6)),mean(MancolOne(1:1:6)),mean(RaymondcolOne(1:1:6))];
%the mean of the time

modelfun = @(b,x)(b(1)+b(2)*log2(6.625)+b(3)*x);%the train model
opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
beta0 = [2;2;2];
[beta,R,J,CovB,MSE3,ErrorModelInfo] = nlinfit(y,z1,modelfun,beta0,opts);
x3=[6:0.1:10];
y3=beta(1,1)+beta(2,1)*log2(6.625)+beta(3,1)*x3;%use the training model's parameter
y6=beta(1,1)+beta(2,1)*log2(6.625)+beta(3,1)*6.0125;%get the real line from module

figure(3);%plot both hand index relation to time
plot(x3,y3);
xlabel({"Both hand Index length size",'(flicking)'});
ylabel("time");
saveas(figure(3),'flicking Both hand Index length size.png');