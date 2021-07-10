clc
clear all
close all

t0=0;
tfi=10;
dt=.01;
t=t0:dt:tfi;

%km=.098;
%Jeq=9.64e-6;
km=1;
Jeq=1;
Rm=3.3;


w(1)=0;
Vt=1;
w(1)=0;
theta(1)=0;
SP=10;

for i=1:length(t)-1


dw(i)=(Vt-km*w(i))*(km/(Jeq*Rm));
w(i+1)=sum(dw*dt);
theta(i+1)=sum(w*dt);
end

figure,hold on
plot(t,w)
plot(t,SP*ones(1,length(t)),'r')
hold off