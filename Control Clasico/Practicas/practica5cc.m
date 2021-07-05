clc
close all
clear all

m=1;
b=-2;
k=5;



dt=.01;
t=0:dt:10;

Gs=tf([1],[m b k]);

figure,pzmap(Gs)
figure,plot(t,step(Gs,t))
figure,bode(Gs)
