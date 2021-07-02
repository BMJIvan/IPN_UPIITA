clc
close all
clear all

AB=4;
BD=18;
d=12;
rad=pi/180;

theta=(0:10:360)*rad;
x=1:36;
y=1:36;
for n=1:37
BC=(AB^2+d^2-(2*AB*d*cos(theta(n))))^.5;
beta=asin((AB*sin(theta(n)))/(BC));
x(n)=(BD-BC)*cos(beta);
y(n)=(BD-BC)*sin(beta);
end
plot(x,y)