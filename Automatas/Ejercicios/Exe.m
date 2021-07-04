clc
clear all
close all
P2=trotx(180/2)*trotz(180/2)*troty(180/4)
trplot(P2)
a=atan2(1,1)*180/pi;
mag=sqrt((1/sqrt(3))^2+(1/sqrt(3))^2);
Bcom=(atan2(1/sqrt(3),mag))*180/pi;
B=90-Bcom;

P3=trotz(a)*troty(B)*trotz(90)*troty(-B)*trotz(-a);

theta=90;
c=cos((theta/180)*pi);
s=sin((theta/180)*pi);
vt=1-cos((theta/180)*pi);
kx=1/sqrt(3);
ky=1/sqrt(3);
kz=1/sqrt(3);
Rth=[((vt*kx^2)+c),(kx*ky*vt-kz*s),kx*kz*vt+ky*s
    kx*ky*vt+kz*s,vt*ky^2+c,ky*kz*vt-kx*s
    kx*kz*vt-ky*s,ky*kz*vt+kx*s,kz^2*vt+c];

disp(P3)
disp(Rth)

p0=[4;-20;0;1];
p1=transl(6,0,0);
p2=p1*troty(90);
p3=transl(0,4,0)*p2;
p4=trotx(90)*p3;
disp(p4(:,4))
pp4=inv(p4)*p0

H01=trotz(-90)*troty(90)*transl(-1,0,0);
H02=trotz(-90)*trotx(90)*transl(-1,0,0);
H12=troty(-90)*trotx(90)*transl(-1,-1,0)
inv(H01)*H02


%pith y
%alabeo z
%yaw x