clc
clear all
close all

l1=1;
l2=1;
r1=34.14213568;
r2=r1;
c=.01;
dt=.01;
t=0:dt:1;
Gs=tf([1],[(l1*l2*c) (l1*r2*c+r1*c*l2) (r1*c*r2+l2+l1) (r1+r2)]);
figure,plot(impulse(Gs,t))
figure,pzmap(Gs)
