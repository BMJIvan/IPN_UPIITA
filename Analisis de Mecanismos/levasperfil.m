clear all
close all
clc

rb=2;
h=.8;
B=60;
rad=pi/180;
grados=180/pi;

theta=(0:10:360);
y=0:36;

for n=1:13
y(n)=0;
end


for n=14:16
y(n)=2*h*((theta(n)-120)/(B))^2;
end


for n=17:19
y(n)=h*(1-2*(1-((theta(n)-120)/60))^2);
end


for n=20:22
y(n)=.8;
end


for n=23:29
y(n)=h*(1-2*((theta(n)-210)/(150))^2);
end


for n=30:37
y(n)=2*h*(1-((theta(n)-210)/(150)))^2;
end

%plot(theta,y)

theta=(0:10:360)*rad;


r=2;
xp=0:36;
yp=0:36;

for n=1:37
xp(n)=r*cos(theta(n));
yp(n)=r*sin(theta(n));
end

plot(xp,yp)
hold on
grid on

r=y+2;
xp=0:36;
yp=0:36;

for n=1:37
xp(n)=r(n)*cos(theta(n));
yp(n)=r(n)*sin(theta(n));
end

plot(xp,yp)

r=1.5/2;
xp=0:36;
yp=0:36;

for n=1:37
xp(n)=r*cos(theta(n));
yp(n)=r*sin(theta(n));
end

plot(xp,yp)
