clc
close all
clear all

A=[0,1,0;0,0,1;-1,-5,-6];
B=[0;1;1];
C=[1,0,0];

syms s k1 k2 k3 k4

% fi=.591155;
% wn=9.021886;
% 
% polo(1)=-fi*wn+(wn*(sqrt(fi^2-1)))
% polo(2)=-fi*wn-(wn*(sqrt(fi^2-1)))

A=[A,zeros(3,1)
   -C,0];
B=[B;0];

K=[k1,k2,k3,k4];
L=size(B,1);
I=eye(L);
F=[-2,4,0,0;-4,-2,0,0;0,0,-10,-1;0,0,0,-10];
% disp(F)
Kr=ones(1,4)*(-10);

% Mobs=[Kr;Kr*F;Kr*F^2];
% rank(Mobs)

P=lyap(A,-F,-B*Kr);
Pinv=inv(P);
K=Kr*Pinv;
disp(K)
eig(A-B*K)