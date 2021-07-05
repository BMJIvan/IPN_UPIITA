clc
%clear all
close all
clear xp x xpp
t0=0;
tf=10;
dt=.01;
t=t0:dt:tf;

m=1;
b=1;
k=1;
%F=ones(1,length(t));
%F=t;
F=t+sin(t);
x(1)=0;
xp(1)=0;

for i=1:length(t)-1
xpp(i)=(F(i)-b*xp(i)-k*x(i))/m;
xp(i+1)=sum(xpp*dt);
x(i+1)=sum(xp*dt);
   
end
plot(t,x)
y3=x;
