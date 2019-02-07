y=[JackiesHandsize(5), YsHandsize(5),ManHandsize(5),RaymondHandsize(5)];
%the left hand index
z1=[mean(JackiecolOne(1:2:6)),mean(YScolOne(1:2:6)),mean(MancolOne(1:2:6)),mean(RaymondcolOne(1:2:6))];
%left index size time

modelfun = @(b,x)(b(1)+b(2)*log2(8.5)+b(3)*x);%the train model
opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
beta0 = [2;2;2];
[beta,R,J,CovB,MSE1,ErrorModelInfo] = nlinfit(y,z1,modelfun,beta0,opts);
x3=[6:0.1:8];
x3=[6:0.1:10];
y3=beta(1,1)+beta(2,1)*log2(8.5)+beta(3,1)*x3;%get the real line from module
y4=beta(1,1)+beta(2,1)*log2(8.5)+beta(3,1)*8.125;%get the real line from module

figure(1);%plot left hand index relation to time
plot(x3,y3);
xlabel({"Left hand index length size",'(pointing)'});
ylabel("time");
saveas(figure(1),'pointing Left hand index length size.png');
%%
y=[JackiesHandsize(6), YsHandsize(6),ManHandsize(6),RaymondHandsize(6)];%right hand index
%right hand index
z1=[mean(JackiecolOne(2:2:6)),mean(YScolOne(2:2:6)),mean(MancolOne(2:2:6)),mean(RaymondcolOne(2:2:6))];
%right index time

modelfun = @(b,x)(b(1)+b(2)*log2(8.5)+b(3)*x);%the train model
opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
beta0 = [2;2;2];
[beta,R,J,CovB,MSE2,ErrorModelInfo] = nlinfit(y,z1,modelfun,beta0,opts);
x3=[6:0.1:10];
y3=beta(1,1)+beta(2,1)*log2(8.5)+beta(3,1)*x3;%use the model's parameter to fit
y5=beta(1,1)+beta(2,1)*log2(8.5)+beta(3,1)*8.075;%get the real line from module

figure(2);%plot the right hand index to the time
plot(x3,y3);
xlabel({"Right hand index length size",'(pointing)'});
ylabel("time");
saveas(figure(2),'pointing Right hand index length size.png');
%%
y=[mean(JackiesHandsize(5:1:6)), mean(YsHandsize(5:1:6)),mean(ManHandsize(5:1:6)),mean(RaymondHandsize(5:1:6))];
%the mean of the index
z1=[mean(JackiecolOne(1:1:6)),mean(YScolOne(1:1:6)),mean(MancolOne(1:1:6)),mean(RaymondcolOne(1:1:6))];
%the mean of the time

modelfun = @(b,x)(b(1)+b(2)*log2(8.5)+b(3)*x);%the train model
opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
beta0 = [2;2;2];
[beta,R,J,CovB,MSE3,ErrorModelInfo] = nlinfit(y,z1,modelfun,beta0,opts);
x3=[6:0.1:10];
y3=beta(1,1)+beta(2,1)*log2(8.5)+beta(3,1)*x3;%use the training model's parameter
y6=beta(1,1)+beta(2,1)*log2(8.5)+beta(3,1)*8.1;%get the real line from module

figure(3);%plot both hand index relation to time
plot(x3,y3);
xlabel({"Both hand index length size",'(pointing)'});
ylabel("time");
saveas(figure(3),'pointing Both hand index length size.png');