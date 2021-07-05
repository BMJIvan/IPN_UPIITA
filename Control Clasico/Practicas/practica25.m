clc
clear all
close all

wn=1;
z=1;
t0=0;
dt=.01;
tfi=3;
t=t0:dt:tfi;
Gs=tf([wn^2],[1 2*z*wn wn^2]);
%xt=ones(1,length(t));

xt=sin(t*6.28);
yt=lsim(Gs,xt,t);
hold on
plot(t,xt)
plot(t,yt,'r')
plot(t,xt'-yt,'k')
hold off