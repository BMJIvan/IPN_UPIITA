clc
clear all
close all

% 
% U=1;
% w1=(2*U)/3;
% w2=w1;
% 
% x1=1;
% x2=1;

x1=0;
x2=0;

U=-1;
w1=-2;
w2=0;
n=w1*x1+w2*x2-U;
not=hardlim(n)

U=1;
w1=2;
w2=0;
n=w1*x1+w2*x2-U;
buffer=hardlim(n)


U=-1;
w1=-2/3;
w2=-2/3;
n=w1*x1+w2*x2-U;
nand=hardlim(n)


U=-1;
w1=-2;
w2=-2;
n=w1*x1+w2*x2-U;
nor=hardlim(n)



