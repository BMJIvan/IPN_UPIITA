clc
close all
clear all

A=[0,1;.2,.1];
B=[.4;-.6];
C=[1,1];
I=eye(size(A,1));

syms z k
X0=[-1;4];
Q=inv(z*I-A);
U=-10*(z/(z-1));
Xk=(iztrans(Q*z,z)*X0)+iztrans(Q*B*U,z);
Xk=subs(Xk,z,k);