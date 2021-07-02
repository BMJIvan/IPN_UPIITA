clc
close all
clear all

rad=pi/180;
grados=180/pi;
w=10/60;
t_revolucion=1/w;
E1=2.58819;
E2=23.18221;
E3=10;
h=10;
d=9;

beta=asin(E1/h);
Hbeta=2*beta*grados
RT=((pi)+(2*beta))/((pi)-(2*beta))
t_avance=(t_revolucion)/(1+(1/RT))
t_retroceso=t_revolucion/(1+RT)
H=2*E2*sin(beta)

gamma1=(pi/2)-beta;
D=asin((h+d-(E2*sin(gamma1)))/(E3));
XE1=(E2*cos(gamma1))-(E3*cos(D))

gamma2=(pi/2)+(beta);
D=asin((h+d-(E2*sin(gamma2)))/(E3));
XE2=(E2*cos(gamma2))-(E3*cos(D))

