clc
clear all
close all
 
 
grados=180/pi;
rad=pi/180;
 
wrpm=100;
rb=1;
w=(wrpm/60)*2*pi;
y=1:21;
 

h=2; 
B=90;
theta=0:5:360;

for n=1:10
y(n)=2*h*(theta(n)/B)^2;
end

for n=10:18
y(n)=h*(1-2*(1-(theta(n)/B))^2);
end

for n=19:25
y(n)=h;
end

h=.5;
B=60;
theta=((0:5:360))-120;
for n=25:37
y(n)=((h/2)*(1+cos((pi*theta(n))/(B))))+1.5;
end

h=1.5;
for n=37:55
y(n)=h;
end


B=90;
theta=((0:5:360))-270;
for n=55:64
y(n)=h*(1-2*((theta(n)/B)^2));
end

for n=64:73
y(n)=2*h*((1-(theta(n)/B)))^2;
end


plot(0:5:360,y)

theta=(0:5:360)*rad;

xp=0:36;
yp=0:36;

for n=1:73
xp(n)=rb*cos(theta(n));
yp(n)=rb*sin(theta(n));
end

plot(xp,yp)
hold on
grid on

r=y+rb;
xp=0:36;
yp=0:36;

for n=1:73
xp(n)=r(n)*cos(theta(n));
yp(n)=r(n)*sin(theta(n));
end

plot(xp,yp)



h=.5;
B=60;
theta=(0:5:360)-120;

y=((h/2)*(1+cos((pi*theta(30))/(B))))+1.5+rb
v=-pi*h*w*sin((pi*theta(30))/B)*(1/(2*B*rad))
a=-(h*(pi*w)^2*cos((pi*theta(n))/B))*(1/(2*(B*rad)^2))