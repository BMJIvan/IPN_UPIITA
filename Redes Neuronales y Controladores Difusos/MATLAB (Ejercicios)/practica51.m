clc
clear all
close all

FIS=readfis('E:\semestre 5\sistemas neurodifusos\matlab\practica5.fis');
for n=-20:.1:20
u=uint8(n*10);
p=evalfis(n,FIS);
tp(u+201)=p;
end

m=1;
b=1;
k=1;
dt=.01;
%tf=10;
t=0:dt:10;

%F=1;
SP=5;
x(1)=0;
xp(1)=0;
E(1)=0;
dE(1)=0;
kp=10;
kd=5;
ki=5;
i=1;
%FIS=readfis('E:\semestre 5\sistemas neurodifusos\practica5.fis');

for i=1:length(t)-1
E(i+1)=SP-x(i);

%PID
% dE(i)=(E(i+1)-E(i))/dt;
% Ei(i)=sum(E*dt);
% F(i)=E(i)*kp+dE(i)*kd+Ei(i)*ki;

%F=evalfis(E(i+1),FIS);
F(i)=tp(uint8(10*(E(i+1)))+201);
%xpp(i)=(F(i)-b*xp(i)-k*x(i))/m;

xpp(i)=(F(i)-b*xp(i)-k*x(i))/m;
xp(i+1)=sum(xpp*dt);
x(i+1)=sum(xp*dt);
end
hold on
plot(t,x)
plot(t(1:length(t)),SP*ones(1,length(t)),'r')
plot(t(1:length(t)),E,'g')
%plot(t(1:length(t)-1),F,'b')
axis([0 10 -10 10])
hold off
% figure,
% 
% hold on
% for p=1:length(t)
%     cla
%     area([x(p) x(p)+1],[1 1])
%     axis([-5 10 -5 5])
%     pause(.01)
% end
% hold off
% 

%E=-20;
%F=tf(E+21)