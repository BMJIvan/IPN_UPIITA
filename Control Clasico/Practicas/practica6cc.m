clc
clear all
close all

c=1;
r=1;
l=1;
r2=1;

Gs=tf([1],[(r*c*l) (r*r2*c+l) (r2+r)]);
dt=.01;
t=0:dt:10;
figure,plot(t,impulse(Gs,t))