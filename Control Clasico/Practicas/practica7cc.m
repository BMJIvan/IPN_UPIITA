clc
close all
clear all

r1=1;
r2=1;
l1=1;
l2=1;
c=1;
Gs=tf([l2 r2],[(c*l2) (r2*c) 1]);
dt=.01;
t=0:dt:50;
figure,plot(t,step(Gs,t))