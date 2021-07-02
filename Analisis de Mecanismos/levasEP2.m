clc
close all
clear all

rb=150/2;
rad=pi/180;
grados=180/pi;
w=200;
y=0:36;


h=100;
B=180*rad;
theta=(0:10:360)*rad;

for n=1:10
y(n)=2*h*(theta(n)/B)^2;
end

for n=11:19
y(n)=h*(1-2*((1-theta(n)/B)^2));
end

for n=19:19
y(n)=0;
end

theta=(0:10:360)*rad-pi;
for n=20:28
y(n)=2*h*(theta(n)/B)^2;
end

for n=29:37
y(n)=h*(1-2*((1-theta(n)/B)^2));
end

for n=37:37
y(n)=0;
end

plot(0:10:360,y)


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

r=100/2;
xp=0:36;
yp=0:36;

for n=1:37
xp(n)=r*cos(theta(n));
yp(n)=r*sin(theta(n));
end

plot(xp,yp)

