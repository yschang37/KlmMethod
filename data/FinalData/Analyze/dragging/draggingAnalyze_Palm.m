
y=[JackiesHandsize(11), YsHandsize(11),ManHandsize(11),RaymondHandsize(11)];%left thumb size
z1=[mean([JackiecolOne(1:4:12);JackiecolOne(2:4:12)]),mean([YScolOne(1:4:12);YScolOne(2:4:12)]),mean([MancolOne(2:4:12);MancolOne(2:4:12)]),mean([RaymondcolOne(1:4:12);RaymondcolOne(2:4:12)])];
%left thumb size time

modelfun = @(b,x)(b(1)+b(2)*log2(8.5)+b(3)*x);%the train model
opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
beta0 = [2;2;2];
[beta,R,J,CovB,MSE1,ErrorModelInfo] = nlinfit(y,z1,modelfun,beta0,opts);
x3=[6:0.1:8];
y3=beta(1,1)+beta(2,1)*log2(8.5)+beta(3,1)*x3;%get the real line from module
y4=beta(1,1)+beta(2,1)*log2(8.5)+beta(3,1)*10.9;%get the real line from module

figure(1);%plot left hand thumb relation to time
plot(x3,y3);
xlabel({"Left hand thumb length size",'(dragging)'});
ylabel("time");
saveas(figure(1),'dragging Left hand thumb length size.png');
% saveas(figure(1),'Barchart.png')
%%
y=[JackiesHandsize(12), YsHandsize(12),ManHandsize(12),RaymondHandsize(12)];%right hand thumb
z1=[mean([JackiecolOne(3:4:12);JackiecolOne(4:4:12)]),mean([YScolOne(3:4:12);YScolOne(4:4:12)]),mean([MancolOne(3:4:12);MancolOne(4:4:12)]),mean([RaymondcolOne(3:4:12);RaymondcolOne(4:4:12)])];
%right thumb time and because it is dragging, i use different to get the
%mean
modelfun = @(b,x)(b(1)+b(2)*log2(8.5)+b(3)*x);%the train model
opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
beta0 = [2;2;2];
[beta,R,J,CovB,MSE2,ErrorModelInfo] = nlinfit(y,z1,modelfun,beta0,opts);
x3=[6:0.1:8];
y3=beta(1,1)+beta(2,1)*log2(8.5)+beta(3,1)*x3;%use the model's parameter to fit
y5=beta(1,1)+beta(2,1)*log2(8.5)+beta(3,1)*10.7;%get the real line from module

figure(2);%plot the right hand thumb to the time
plot(x3,y3);
xlabel({"Right hand thumb length size",'(dragging)'});
ylabel("time");
saveas(figure(2),'dragging Right hand thumb length size.png');
%%
y=[mean(JackiesHandsize(11:1:12)), mean(YsHandsize(11:1:12)),mean(ManHandsize(11:1:12)),mean(RaymondHandsize(11:1:12))];
%the mean of the thumb
z1=[mean(JackiecolOne(1:1:12)),mean(YScolOne(1:1:12)),mean(MancolOne(1:1:12)),mean(RaymondcolOne(1:1:12))];
%the mean of the time

modelfun = @(b,x)(b(1)+b(2)*log2(8.5)+b(3)*x);%the train model
opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
beta0 = [2;2;2];
[beta,R,J,CovB,MSE3,ErrorModelInfo] = nlinfit(y,z1,modelfun,beta0,opts);
x3=[6:0.1:8];
y3=beta(1,1)+beta(2,1)*log2(8.5)+beta(3,1)*x3;%use the training model's parameter
y6=beta(1,1)+beta(2,1)*log2(8.5)+beta(3,1)*10.8;%get the real line from module


figure(3);%plot both hand thumb mean
plot(x3,y3);
xlabel({"Both hand thumb length size",'(dragging)'});
ylabel("time");
saveas(figure(3),'dragging Both hand thumb length size.png');