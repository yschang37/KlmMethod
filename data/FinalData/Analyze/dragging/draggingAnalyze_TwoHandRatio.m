y=[JackiesHandsize(3), YsHandsize(3),ManHandsize(3),RaymondHandsize(3)];%the left index
y4=[JackiesHandsize(1), YsHandsize(1),ManHandsize(1),RaymondHandsize(1)];%the left thumb
y=y./y4;%know the left hand ration between index and thumb

z1=[mean([JackiecolOne(1:4:12);JackiecolOne(2:4:12)]),mean([YScolOne(1:4:12);YScolOne(2:4:12)]),mean([MancolOne(2:4:12);MancolOne(2:4:12)]),mean([RaymondcolOne(1:4:12);RaymondcolOne(2:4:12)])];
%left finger time

modelfun = @(b,x)(b(1)+b(2)*log2(7.5)+b(3)*x.^5);%the train model
opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
beta0 = [2;2;2];
beta = nlinfit(y,z1,modelfun,beta0,opts);
x3=[1:0.01:1.5];
y3=beta(1,1)+beta(2,1)*log2(7.5)+beta(3,1)*x3.^5;%get the real line from module

figure(1);%plot left raito relation to time
plot(x3,y3);
xlabel({"Left hand Ratio",'(dragging)'});
ylabel("time");
saveas(figure(1),'dragging Left hand Ratio.png');
%%
y=[JackiesHandsize(4), YsHandsize(4),ManHandsize(4),RaymondHandsize(4)];
y4=[JackiesHandsize(2), YsHandsize(2),ManHandsize(2),RaymondHandsize(2)];
y=y./y4;%know the right hand ration between index and thumb
z1=[mean([JackiecolOne(3:4:12);JackiecolOne(4:4:12)]),mean([YScolOne(3:4:12);YScolOne(4:4:12)]),mean([MancolOne(3:4:12);MancolOne(4:4:12)]),mean([RaymondcolOne(3:4:12);RaymondcolOne(4:4:12)])];
%right finger time

modelfun = @(b,x)(b(1)+b(2)*log2(7.5)+b(3)*x.^5);%the train model
opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
beta0 = [2;2;2];
beta = nlinfit(y,z1,modelfun,beta0,opts);
x3=[1:0.01:1.5];
y3=beta(1,1)+beta(2,1)*log2(7.5)+beta(3,1)*x3.^5;%use the model's parameter to fit

figure(2);%plot the right hand ratio to the time
plot(x3,y3);
xlabel({"Right hand Ratio",'(dragging)'});
ylabel("time");
saveas(figure(2),'dragging Right hand Ratio.png');
%%
y=[mean(JackiesHandsize(3:1:4)), mean(YsHandsize(3:1:4)),mean(ManHandsize(3:1:4)),mean(RaymondHandsize(3:1:4))];
y4=[mean(JackiesHandsize(1:1:2)), mean(YsHandsize(1:1:2)),mean(ManHandsize(1:1:2)),mean(RaymondHandsize(1:1:2))];
y=y./y4;%the ratio of mean of the index and thumb
z1=[mean(JackiecolOne(1:1:12)),mean(YScolOne(1:1:12)),mean(MancolOne(1:1:12)),mean(RaymondcolOne(1:1:12))];
%the mean of the time

modelfun = @(b,x)(b(1)+b(2)*log2(7.5)+b(3)*x.^5);%the train model
opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
beta0 = [2;2;2];
beta = nlinfit(y,z1,modelfun,beta0,opts);
x3=[1:0.01:1.5];
y3=beta(1,1)+beta(2,1)*log2(7.5)+beta(3,1)*x3.^5;%use the training model's parameter

figure(3);%plot both ratio relation to time
plot(x3,y3);
xlabel({"Both hand Ratio",'(dragging)'});
ylabel("time");
saveas(figure(3),'dragging Both hand Ratio.png');