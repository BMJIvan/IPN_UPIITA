clc
close all
clear all

A=[2,.5;0,.8];
B=[-5;2];
C=[1,1];
I=eye(size(A,1));

syms z k
X0=[-1;-1];
Q=inv(z*I-A);
U=z/(z-1);
Xk=(iztrans(Q*z,z)*X0)+(5*iztrans(Q*B*U,z));
Xk=subs(Xk,z,k);