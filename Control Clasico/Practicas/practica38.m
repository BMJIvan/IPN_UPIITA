clc
clear all
close all

t=0:0.01:10;
A1=3;
w=2;
f1=pi/4;
xt=A1*sin(w*t+pi/4);

s=w*j;
G=1/(s^2+s+1);

f2=atan2(imag(G),real(G));
A2=abs(G);
f3=f1+f2
A3=A1*A2

xtt=A3*sin(w*t+f3);

Gs=tf([1],[1 1 1]);
xttt=lsim(Gs,xt,t);

hold on
plot(t,xt)
plot(t,xtt)
plot(t,xttt)