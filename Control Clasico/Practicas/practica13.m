clc
clear T Tpp Tp
close all

t0=0;
tf=10;
dt=.01;
t=t0:dt:tf;
m=1;
g=9.81;
l=1;
b=1;
tao=ones(1,length(t))+t;
%tao=t+sin(t);
T(1)=0;
Tp(1)=0;
% SP=pi*3/4;
% k=200;
% kp=35;
% ki=35;
for i=1:length(t)-1
%     E(i+1)=SP-T(i);
%     Ep(i+1)=(E(i+1)-E(i))/dt;
%     Ei(i+1)=sum(E(i+1)*dt);
%     tao=E(i+1)*k+Ep(i+1)*kp+Ei(i+1)*ki;
    Tpp(i)=(tao(i)-(m*g*l*sin(T(i))))/(m*l*l);
    %Tpp(i)=(tao-1*Tp(i)-(m*g*l*sin(T(i))))/(m*l*l);
    %Tpp(i)=(tao-Tp(i)*b-(m*g*l*sin(T(i))))/(m*l*l);
    Tp(i+1)=sum(Tpp*dt);
    T(i+1)=sum(Tp*dt);
end

figure,plot(t,T)
y5=T;
% x=l*cos(T);
% y=l*sin(T);
% figure
% for i=1:length(t)
% cla
% hold on
% 
% x=l*sin(T(i));
% y=l*cos(T(i));
% plot([0 x],[0 -y])
% plot([0 x],[0 -y],'o')
% axis([-3 3 -3 3])
% pause(.0125)
% end
% hold off