clc
clear all
close all
format long

rad=pi/180;
BA=10;
BP=20;

x=0:36;
y=0:36;
theta=(0:10:360)*rad;
for n=1:37
y(n)=BA*sin(theta(n));
x(n)=BP*cos(theta(n));
end

plot(x,y)