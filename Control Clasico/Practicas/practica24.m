clc
clear all
close all

k1=5.0759;
k2=1.69048;

t0=0;
dt=.01;
tfi=30;
t=t0:dt:tfi;
Z=.259445;
%for Z=1:-.001:0
%cla
%Z=.8;
wn=1;
Gs=tf([wn],[1 2*wn*Z wn*wn]);
y=step(Gs,t);
tp=(pi)/(wn*sqrt(1-Z*Z));
tr=(pi-sqrt(1-Z*Z))/(wn*sqrt(1-Z*Z));
ts=4/(Z*wn);
mp=exp(-(Z*pi)/(sqrt(1-Z*Z)))
hold on
plot(t,y)
stem([tp],max(y),'r')
stem([tr],mean(y),'k')
stem([ts],mean(y),'k')
plot([tp tp],[mean(y) mean(y)+mp*mean(y)],'*')
axis([t0 tfi -2 2])
title(num2str(Z))
pause(.1)

% end
% Gs=tf([k1],[1 k1*k2 k1]);
% y=step(Gs,t);
% plot(t,y)
% %[]