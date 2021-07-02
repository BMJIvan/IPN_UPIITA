clc
clear all
close all
 
 
grados=180/pi;
rad=pi/180;
 
wrpm=200;
rb=2;
w=(wrpm/60)*2*pi;
y=1:21;
 

h=1; 
B=120;
theta=0:10:360;

for n=1:13
y(n)=h*((theta(n)/B)-(1/(2*pi))*(sin((2*pi*theta(n))/(B))));
end

for n=14:16
y(n)=h;
end

theta=(0:10:360)-150;
h=.5;
for n=16:28
y(n)=(h*(1-((theta(n)/B)-(1/(2*pi))*(sin((2*pi*theta(n))/(B))))))+.5;
end


for n=29:31
y(n)=h;
end

theta=(0:10:360)-300;
B=60;
h=.5;
for n=31:37
y(n)=h*(1-((theta(n)/B)-(1/(2*pi))*(sin((2*pi*theta(n))/(B)))));
end

plot(0:10:360,y)
 
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


