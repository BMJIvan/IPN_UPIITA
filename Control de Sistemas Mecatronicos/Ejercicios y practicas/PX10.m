clc
close all
clear all

A=[0,1,0;0,0,1;0,-5,-6];
B=[0;0;1];
C=[1,0,0];

syms s k1 k2 k3

fi=.591155;
wn=9.021886;

polo(1)=-fi*wn+(wn*(sqrt(fi^2-1)))
polo(2)=-fi*wn-(wn*(sqrt(fi^2-1)))

K=[k1,k2,k3];
L=size(B,1);
I=eye(L);
F=[5*real(polo(1)),0,0;0,real(polo(1)),imag(polo(1));0,-imag(polo(1)),real(polo(1))];
% disp(F)
Kr=ones(1,3)*(-3);

% Mobs=[Kr;Kr*F;Kr*F^2];
% rank(Mobs)

P=lyap(A,-F,-B*Kr);
Pinv=inv(P);
K=Kr*Pinv;
disp(K)
eig(A-B*K)