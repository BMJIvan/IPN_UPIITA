close all
clear all
clc

m=1;
b=-2;
k=5;
t=0:0.01:100;
xt=sin(t);

Gs=tf([1],[m b k]);
yt=impulse(Gs,t);
%yt=lsim(Gs,xt,t);
plot(t,yt)
figure,pzmap(Gs)
figure,bode(Gs)
roots([1 -2 5])