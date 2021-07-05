clc
clear all
close all

m=1;
k=1;
b=1.5;
F=1;

t0=0;
dt=.01;
tf=10;
t=t0:dt:tf;

sp=2*ones(1,length(t));
e=0*ones(1,length(t)+1);
ep=0*ones(1,length(t)+1);
ei=0*ones(1,length(t)+1);

x(1)=0;
xp(1)=0;

for i=1:length(t)-1
xpp(i)=(F-b*xp(i)-k*x(i))/m;
xp(i+1)=sum(xpp*dt);
x(i+1)=sum(xp*dt);
e(i+1)=sp(i)-x(i);
ep(i)=(e(i+1)-e(i))/dt;
ei(i)=sum(e*dt);
F=e(i+1)*5+ep(i)+ei(i);
end

hold on
plot(t,x)
plot(t,sp,'r')
hold off