clc
close all
clear all

rb=40;
rad=pi/180;
grados=180/pi;
w=150;
y=0:36;

theta=(0:10:360)*rad;
h=24;
B=60*rad;
for n=1:7
y(n)=(h/2)*(1-cos(pi*theta(n)/B));
end

for n=8:16
y(n)=h;
end

h=10;
B=90*rad;
theta=(0:10:360)*rad-(pi*15/18);
for n=17:25
y(n)=(h/2)*(1+cos(pi*theta(n)/B))+14;
end

for n=26:31
y(n)=14;
end

h=14;
B=60*rad;
theta=(0:10:360)*rad-(pi*30/18);
for n=32:37
y(n)=(h/2)*(1+cos(pi*theta(n)/B));
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


