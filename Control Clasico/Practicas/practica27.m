clc
clear all
close all
t=0:.01:10;
T=2;
J=1;
B=1;
xt=t;
Gs=tf([1],[T 1])
yt=lsim(Gs,xt,t);

hold on
plot(t,xt)
plot(t,yt,'r')
plot(t,xt'-yt,'k')
hold off