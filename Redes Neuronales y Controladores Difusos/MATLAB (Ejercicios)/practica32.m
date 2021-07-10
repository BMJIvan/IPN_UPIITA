clc
clear all
close all

P=[1,1;-1,1;-1,-1];
T=[-1,1];
Pm=inv(P'*P)*P';
W=T*Pm;
Pp=[1;1;-1];
a=purelin(W*Pp)