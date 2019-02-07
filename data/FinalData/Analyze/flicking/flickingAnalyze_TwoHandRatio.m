y=[JackiesHandsize(3), YsHandsize(3),ManHandsize(3),RaymondHandsize(3)];%the left index
y4=[JackiesHandsize(1), YsHandsize(1),ManHandsize(1),RaymondHandsize(1)];%the left thumb
y=y./y4;%know the left hand ration between index and thumb
z1=[mean(JackiecolOne(1:2:6)),mean(YScolOne(1:2:6)),mean(MancolOne(1:2:6)),mean(RaymondcolOne(1:2:6))];
%left finger time

modelfun = @(b,x)(b(1)+b(2)*log2(0.5)+b(3)*x.^3);%the train model
opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
beta0 = [2;2;2];
beta = nlinfit(y,z1,modelfun,beta0,opts);
x3=[1:0.01:1.5];
y3=beta(1,1)+beta(2,1)*log2(0.5)+beta(3,1)*x3.^3;%get the real line from module

figure(1);%plot left raito relation to time
plot(x3,y3);
xlabel({"Left hand Ratio",'(flicking)'});
ylabel("time");
saveas(figure(1),'flicking Left hand Ratio.png');
%%
y=[JackiesHandsize(4), YsHandsize(4),ManHandsize(4),RaymondHandsize(4)];
y4=[JackiesHandsize(2), YsHandsize(2),ManHandsize(2),RaymondHandsize(2)];
y=y./y4;%know the right hand ration between index and thumb
z1=[mean(JackiecolOne(2:2:6)),mean(YScolOne(2:2:6)),mean(MancolOne(2:2:6)),mean(RaymondcolOne(2:2:6))];

modelfun = @(b,x)(b(1)+b(2)*log2(0.5)+b(3)*x.^5);%the train model
opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
beta0 = [2;2;2];
beta = nlinfit(y,z1,modelfun,beta0,opts);
x3=[1:0.01:1.5];
y3=beta(1,1)+beta(2,1)*log2(0.5)+beta(3,1)*x3.^5;%use the model's parameter to fit

figure(2);%plot the right hand ratio to the time
plot(x3,y3);
xlabel({"Right hand Ratio",'(flicking)'});
ylabel("time");
saveas(figure(2),'flicking Right hand Ratio.png');
%%
y=[mean(JackiesHandsize(3:1:4)), mean(YsHandsize(3:1:4)),mean(ManHandsize(3:1:4)),mean(RaymondHandsize(3:1:4))];
y4=[mean(JackiesHandsize(1:1:2)), mean(YsHandsize(1:1:2)),mean(ManHandsize(1:1:2)),mean(RaymondHandsize(1:1:2))];
y=y./y4;%the ratio of mean of the index and thumb
z1=[mean(JackiecolOne(1:1:6)),mean(YScolOne(1:1:6)),mean(MancolOne(1:1:6)),mean(RaymondcolOne(1:1:6))];
%the mean of the time

modelfun = @(b,x)(b(1)+b(2)*log2(0.5)+b(3)*x.^5);%the train model
opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
beta0 = [2;2;2];
beta = nlinfit(y,z1,modelfun,beta0,opts);
x3=[1:0.01:1.5];
y3=beta(1,1)+beta(2,1)*log2(0.5)+beta(3,1)*x3.^5;%use the training model's parameter

figure(3);%plot both ratio relation to time
plot(x3,y3);
xlabel({"Both hand Ratio",'(flicking)'});
ylabel("time");
saveas(figure(3),'flicking Both hand Ratio.png');