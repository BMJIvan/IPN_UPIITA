clc
clear all
close all
m=1;
b=.2;
k=1;
t=0:.01:100;
Gs=tf([1],[m b k])
impulse(Gs,t)
a=eig(Gs)
t=1:5

y=exp(-t)