clc
clear all
close all

R=1e5;
c=1e-6;
a=tf('s')
H=1/(R*c*a+1);
T=.005;
t=0:T:.5;
[vo t]=step(H,t);
vo=vo+rand(length(t),1)*.01;

yp=real(log(1-vo));
u=t;

km=u'*yp/(u'*u);
tao=-1/km
tm=0:T:1;
hold on
g=1-exp(km*tm);
hold on
plot(t,vo,'.')
plot(tm,g,'.')
