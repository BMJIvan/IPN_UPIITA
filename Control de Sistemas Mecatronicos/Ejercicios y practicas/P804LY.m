clc
close all
% clear all

syms s Ll

polos=[-3,-2+2i,-2-2i];
A=[-1,1,-2;0,-1,1;0,0,-1];
B=[1;0;1];
C=[1,0,0];

L=size(B,1);
I=eye(L);

F=[-3,0,0;0,-2,-2;0,2,-2];
Lr=[-3;-3;-3];

P=lyap(-F,A,-Lr*C);
Pinv=inv(P);
Ll=Pinv*Lr;
eig(A-Ll*C)

