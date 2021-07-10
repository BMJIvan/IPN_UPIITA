clc
clear all
close all

t=1:5;
yp=[2.2247 5.7321 11.1213 18.4495 27.7386];
u=[.5 1 1.5 2 2.5];
t=t';
yp=yp';
vo=yp;
u=u';

phi=[u.^(1/2) u.^(2)];

theta=inv(phi'*phi)*phi'*yp;
tm=1:0.1:5;
tm=tm';

ym=theta(1)*tm.^(1/2)+theta(2)*tm.^(2);
plot(t,vo,'b',tm,ym,'k')

a=theta(1)^2
b=theta(2)-1