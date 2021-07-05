clc
clear all
close all

t=0:.01:10;
g=tf([10],[1 3 2]);
y=step(t,g);
plot(t,y)
