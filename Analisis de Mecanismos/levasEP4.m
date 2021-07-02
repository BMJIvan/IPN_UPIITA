clc
close all
clear all

rb=100/2;
rad=pi/180;
grados=180/pi;
w=150;
y=0:36;


h=100;
B=120*rad;
theta=(0:10:360)*rad;

for n=1:7
y(n)=2*h*(theta(n)/B)^2;
end

for n=8:13
y(n)=h*(1-2*((1-theta(n)/B)^2));
end

for n=14:24
y(n)=h;
end

theta=((0:10:360)*rad)-pi*(4/3);
for n=25:31
y(n)=h*(1-2*((theta(n)/B)^2));
end

for n=31:37
y(n)=2*h*(1-(theta(n)/B))^2;
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

r=50/2;
xp=0:36;
yp=0:36;

for n=1:37
xp(n)=r*cos(theta(n));
yp(n)=r*sin(theta(n));
end

plot(xp,yp)
