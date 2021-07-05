clc
clear all
close all
t0=0;
tfi=10;
dt=.01;
t=t0:dt:tfi;
b=1;
m=1;
k=1;
F=1;

x(1)=0;
xp(1)=0;


for i=1:length(t)-1
   
    xpp(i)=(F-b*xp(i)-k*x(i))/m;
    xp(i+1)=sum(xpp.*dt);
    x(i+1)=sum(xp.*dt);
    
    
end
hold on
plot(t,x)

A=[0,1;-k/m,-b/m];
B=[0;1];
C=[1,0];
D=[0];
Gs=ss(A,B,C,D);
y=step(Gs,t);
plot(t,y,'r')