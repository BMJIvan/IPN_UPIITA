clc
close all
clear all

syms s Ll

polos=[-1,-2];
A=[0,1;2,3];
B=[1;1];
C=[1,2];

L=size(B,1);
I=eye(L);

F=[-1,0;0,-2];
Lr=[pi;pi];

P=lyap(-F,A,-Lr*C);
Pinv=inv(P);
Ll=Pinv*Lr;
disp(Ll)
eig(A-Ll*C)

