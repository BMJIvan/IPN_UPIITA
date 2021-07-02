clear all
close all
clc
format long

rad=pi/180;
grados=180/pi;
E1=10/12;
E2=3/12;
E3=12/12;
E4=6/12;
cg2=1/12;
cg3=4/12;
cg4=4/12;
W2=5;
W3=10;
W4=15;
I2=.001;
I3=.020;
I4=.010;
t2=170*rad;
g=32.2;
w2=500;
delta=90*rad;


BD=(((E1-E2*cos(t2))^2)+((E2*sin(t2))^2))^.5;;
rho=asin((E2/BD)*sin(t2));
del=acos((BD^2+E4^2-E3^2)/(2*BD*E4));

t4=((pi)-(rho+del))
t3=atan(((E4*sin(t4))-(E2*sin(t2)))/((E1+E4*cos(t4))-(E2*cos(t2))));

det=(E4*sin(t4))*(E3*cos(t3))-(-E3*sin(t3))*(-E4*cos(t4));
detw3=(-E4*sin(t4))*(E2*cos(t2)*w2)-(-E2*sin(t2)*w2)*(E4*cos(t4));
w3=detw3/det

detw4=(E2*sin(t2)*w2)*(E3*cos(t3))-(-E3*sin(t3))*(-E2*cos(t2)*w2);
w4=detw4/det

delta=delta+t3;
t4=((pi)-(rho+del));

A1=(E2*sin(t2)*w2^2)+(E3*sin(t3)*w3^2)-(E4*sin(t4)*w4^2)
A2=(E2*cos(t2)*w2^2)+(E3*cos(t3)*w3^2)-(E4*cos(t4)*w4^2)

det=(E3*cos(t3))*(E4*sin(t4))-(E4*cos(t4))*(E3*sin(t3));

deta3=(A1)*(E4*sin(t4))-(-E4*cos(t4))*(A2);
a3=deta3/det

deta4=(E3*cos(t3))*(A2)-(A1)*(-E3*sin(t3));
a4=deta4/det

acg3y=(-E2*sin(t2)*w2^2)+(-cg3*sin(t3)*w3^2)+(cg3*cos(t3)*a3);
acg3x=(-E2*cos(t2)*w2^2)+(-cg3*cos(t3)*w3^2)+(-cg3*sin(t3)*a3);

acg4y=(cg4*cos(t4)*a4)+(-cg4*sin(t4)*w4^2);
acg4x=(-cg4*sin(t4)*a4)+(-cg4*cos(t4)*w4^2);

acg3=(acg3x^2+acg3y^2)^.5;
acg4=(acg4x^2+acg4y^2)^.5

Fi2=-(W2/g)*(w2^2)*cg2
Fi3=-(W3/g)*acg3
Ti3=-I3*a3
Fi4=-(W4/g)*acg4
Ti4=-I4*a4