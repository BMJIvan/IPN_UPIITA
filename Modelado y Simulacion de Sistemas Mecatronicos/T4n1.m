clc
clear all
close all

t=1:5;
yp=[5.5 1.5 -3.5 4.5 8.5];
u=[-1.5 -.5 4.5 7 8];
t=t';
yp=yp';
vo=yp;
u=u';

phi=[u.^1 u.^2];
theta=inv(phi'*phi)*phi'*yp;
tm=1:0.1:5;
tm=tm';
ym=theta(1)*tm+theta(2)*tm.^(2);
plot(t,vo,'b',tm,ym,'k')

theta(1)
theta(2)