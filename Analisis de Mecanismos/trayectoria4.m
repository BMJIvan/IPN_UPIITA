clc
close all
clear all
format short

E1=15;
E2=4.75;
E3=22.37227-E2;
E4=11.17966;
t2=50;
grados=180/pi;
rad=pi/180;
BD=(((E1-E2*cos(t2))^2)+((E2*sin(t2))^2))^.5;

rho=asin((E2/BD)*sin(t2));
delta=acos((BD^2+E4^2-E3^2)/(2*BD*E4));

t4=(pi)-(rho+delta);
t3=atan(((E4*sin(t4))-(E2*sin(t2)))/((E1+E4*cos(t4))-(E2*cos(t2))));

t21=acos((E1^2+(E3+E2)^2-E4^2)/(2*E1*(E3+E2)));
t22=acos((E1^2+(E3-E2)^2-E4^2)/(2*E1*(E3-E2)));

t41=(asin(((E3+E2)/E4)*sin(t21)))*grados;
t42=(asin(((E3-E2)/E4)*sin(t22)))*grados;

if ((E2+E3)*cos(t21))>E1
t41=180-t41;
end
Ht4=(t41-t42)
angulo_des=(t22-t21)*grados
RT=(180+angulo_des)/(180-angulo_des)

E1=15;
E2=4.75;
E3=17.29242-E2;
E4=9.5;
t2=50;
grados=180/pi;
rad=pi/180;
BD=(((E1-E2*cos(t2))^2)+((E2*sin(t2))^2))^.5;

rho=asin((E2/BD)*sin(t2));
delta=acos((BD^2+E4^2-E3^2)/(2*BD*E4));

t4=(pi)-(rho+delta);
t3=atan(((E4*sin(t4))-(E2*sin(t2)))/((E1+E4*cos(t4))-(E2*cos(t2))));

t21=acos((E1^2+(E3+E2)^2-E4^2)/(2*E1*(E3+E2)));
t22=acos((E1^2+(E3-E2)^2-E4^2)/(2*E1*(E3-E2)));

t41=(asin(((E3+E2)/E4)*sin(t21)))*grados;
t42=(asin(((E3-E2)/E4)*sin(t22)))*grados;

if ((E2+E3)*cos(t21))>E1
t41=180-t41;
end
Ht4=(t41-t42)
angulo_des=(t22-t21)*grados
RT=(180+angulo_des)/(180-angulo_des)
