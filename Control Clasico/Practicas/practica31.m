clc
clear all
close all

t0=0;
dt=.01;
tfi=10;
t=t0:dt:tfi;

for Kp=0:0.2:10
    cla
H=tf([Kp],[1 3 2 Kp]);
pzmap(H)
sgrid
axis([-5 5 -5 5])
drawnow

end