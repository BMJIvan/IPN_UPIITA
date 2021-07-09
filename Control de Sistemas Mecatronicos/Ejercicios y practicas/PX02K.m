clc
clear all
close all

A=[0,1,0,0
   -9/50,0,9/50,0
   0,0,0,1
   1,0,-1,-1];
B=[0;1/50;0;0];
C=[1,0,0,0];

L=size(B,1)

syms s k1 k2 k3 k4

K=[k1,k2,k3,k4];
L=size(B,1);
I=eye(L);
F=[-4,1,-1,4;0,-4,1,-1;0,0,-4,1;0,0,0,-4];
% disp(F)
Kr=ones(1,4)*(-4);

% Mobs=[Kr;Kr*F;Kr*F^2];
% rank(Mobs)

P=lyap(A,-F,-B*Kr);
Pinv=inv(P);
K=Kr*Pinv;
disp(K)
eig(A-B*K)
K=[3991,750,8809,8050];
