clc
clear all
close all

t0=0;
tf=10;
dt=.01;
t=t0:dt:tf;
m=1;
g=9.81;
l=1;
b=1;
tao=0;
T(1)=0;
Tp(1)=0;
SP=pi;
k=100;
kp=20;
ki=20;
for i=1:length(t)-1
    E(i+1)=SP-T(i);
    Ep(i+1)=(E(i+1)-E(i))/dt;
    Ei(i+1)=sum(E(i+1)*dt);
    tao=E(i+1)*k+Ep(i+1)*kp+Ei(i+1)*ki;
    %Tpp(i)=(tao-(m*g*l*sin(T(i))))/(m*l*l);
    %Tpp(i)=(tao-1*Tp(i)-(m*g*l*sin(T(i))))/(m*l*l);
    Tpp(i)=(tao-Tp(i)*b-(m*g*l*sin(T(i))))/(m*l*l);
    Tp(i+1)=sum(Tpp*dt);
    T(i+1)=sum(Tp*dt);
end

%figure,plot(t,T)
% x=l*cos(T);
% y=l*sin(T);
figure
for i=1:150
cla
hold on

x=l*sin(T(i));
y=l*cos(T(i));
plot([0 x],[0 -y])
plot([0 x],[0 -y],'o')
axis([-3 3 -3 3])
pause(.125)
end
hold off