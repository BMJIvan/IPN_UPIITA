clear all
close all
clc
format long

rad=pi/180;
grados=180/pi;
E2=.074;
E3=.200;
e=0;
m2=1;
m3=.5;
m4=.4;
theta=150*rad;
wtheta=100;
I3=.0018;
lg2=.020;
lg3=.060;
I3=.0018;
beta=asin((-(E2*sin(theta))/E3))

wbeta=(-E2*cos(theta)*wtheta)/(E3*cos(beta))

abeta=((E2*sin(theta)*wtheta^2)+(E3*sin(beta)*wbeta^2))/(E3*cos(beta))
Ac=(-E2*cos(theta)*wtheta^2)-(E3*sin(beta)*abeta)-(E3*cos(beta)*wbeta^2)
Acg3x=(-E2*cos(theta)*wtheta^2)-(lg3*sin(beta)*abeta)-(lg3*cos(beta)*wbeta^2)
Acg3y=-(E2*sin(theta)*wtheta^2)-(lg3*sin(beta)*wbeta^2)+lg3*cos(beta)*abeta

Ficg2=m2*lg2*wtheta^2
Ficg4=-m4*Ac
acg3=(Acg3x^2+Acg3y^2)^.5;
Ficg3=-m3*acg3
Ii3=-I3*abeta