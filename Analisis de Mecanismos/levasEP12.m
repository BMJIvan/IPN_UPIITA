clc
clear all
close all

grados=180/pi;
rad=pi/180;
 
wrpm=200;
rb=20;
r_eje=15;
w=(wrpm/60)*2*pi;

theta=0:10:360;
y=[0,.113,.865,2.725,5.865,10.113,15,19.887,24.135,27.275,29.135,29.887,30,30,30,30,30,30,30,29.966,29.736,29.135,28.035,26.369,24.135,21.402,18.3,15,11.7,8.598,5.865,3.631,1.965,.865,.264,.034,0]; 

plot(theta,y)

theta=(0:10:360)*rad;

xp=0:36;
yp=0:36;

for n=1:37
xp(n)=rb*cos(theta(n));
yp(n)=rb*sin(theta(n));
end

plot(xp,yp)
hold on
grid on

r=y+rb;
xp=0:36;
yp=0:36;

for n=1:37
xp(n)=r(n)*cos(theta(n));
yp(n)=r(n)*sin(theta(n));
end

plot(xp,yp)

for n=1:37
xp(n)=r_eje*cos(theta(n));
yp(n)=r_eje*sin(theta(n));
end

plot(xp,yp)
