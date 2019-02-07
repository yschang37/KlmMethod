y=[JackiesHandsize(9), YsHandsize(9),ManHandsize(9),RaymondHandsize(9)];
%the left hand index
z1=[mean([JackiecolOne(1:4:12);JackiecolOne(2:4:12)]),mean([YScolOne(1:4:12);YScolOne(2:4:12)]),mean([MancolOne(2:4:12);MancolOne(2:4:12)]),mean([RaymondcolOne(1:4:12);RaymondcolOne(2:4:12)])];
%left index size time

modelfun = @(b,x)(b(1)+b(2)*log2(8.5)+b(3)*x);%the train model
opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
beta0 = [2;2;2];
[beta,R,J,CovB,MSE1,ErrorModelInfo] = nlinfit(y,z1,modelfun,beta0,opts);
x3=[6:0.1:10];
y3=beta(1,1)+beta(2,1)*log2(8.5)+beta(3,1)*x3;%get the real line from module
y4=beta(1,1)+beta(2,1)*log2(8.5)+beta(3,1)*6.025;%get the real line from module

figure(1);%plot left hand index relation to time
plot(x3,y3);
xlabel({"Left hand Index length size",'(dragging)'});
ylabel("time");
saveas(figure(1),'dragging Left hand Index length size.png');
%%
y=[JackiesHandsize(10), YsHandsize(10),ManHandsize(10),RaymondHandsize(10)];%right hand index
z1=[mean([JackiecolOne(3:4:12);JackiecolOne(4:4:12)]),mean([YScolOne(3:4:12);YScolOne(4:4:12)]),mean([MancolOne(3:4:12);MancolOne(4:4:12)]),mean([RaymondcolOne(3:4:12);RaymondcolOne(4:4:12)])];
%right index time and because it is dragging, i use different to get the
%mean
modelfun = @(b,x)(b(1)+b(2)*log2(8.5)+b(3)*x);%the train model
opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
beta0 = [2;2;2];
[beta,R,J,CovB,MSE2,ErrorModelInfo] = nlinfit(y,z1,modelfun,beta0,opts);
x3=[6:0.1:10];
y3=beta(1,1)+beta(2,1)*log2(8.5)+beta(3,1)*x3;%use the model's parameter to fit
y5=beta(1,1)+beta(2,1)*log2(8.5)+beta(3,1)*6;%get the real line from module

figure(2);%plot the right hand index to the time
plot(x3,y3);
xlabel({"Right hand Index length size",'(dragging)'});
ylabel("time");
saveas(figure(2),'dragging Right hand Index length size.png');
%%
y=[mean(JackiesHandsize(9:1:10)), mean(YsHandsize(9:1:10)),mean(ManHandsize(9:1:10)),mean(RaymondHandsize(9:1:10))];
%the mean of the index
z1=[mean(JackiecolOne(1:1:12)),mean(YScolOne(1:1:12)),mean(MancolOne(1:1:12)),mean(RaymondcolOne(1:1:12))];
%the mean of the time

modelfun = @(b,x)(b(1)+b(2)*log2(8.5)+b(3)*x);%the train model
opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
beta0 = [2;2;2];
[beta,R,J,CovB,MSE3,ErrorModelInfo] = nlinfit(y,z1,modelfun,beta0,opts);
x3=[6:0.1:10];
y3=beta(1,1)+beta(2,1)*log2(8.5)+beta(3,1)*x3;%use the training model's parameter
y6=beta(1,1)+beta(2,1)*log2(8.5)+beta(3,1)*6.0125;%get the real line from module

figure(3);%plot both hand index relation to time
plot(x3,y3);
xlabel({"Both hand Index length size",'(dragging)'});
ylabel("time");
saveas(figure(3),'dragging Both hand Index length size.png');