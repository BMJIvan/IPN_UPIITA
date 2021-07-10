clc
clear all
close all

R1=1e6;
R2=1e6;
c1=1e-7;
c2=1e-12;
t=0:10;

Gs=tf([-1],[R1*c2 0]);
figure,bode(Gs,logspace(-5,12))

Gs=tf([-R2/R1],[R2*c2 1]);
figure,bode(Gs,logspace(-5,12))

Gs=tf([-R1*c1 0],[1]);
figure,bode(Gs,logspace(-5,12))

Gs=tf([-R2*c1 0],[R1*c1 1]);
figure,bode(Gs,logspace(-5,12))

Gs=tf([-R2*c1 0],[R2*c2*R1*c1 (R1*c1+R2*c2) 1]);
figure,bode(Gs,logspace(-5,12))