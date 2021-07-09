clc
% clear all
close all

A=[0,1,0,0;3,0,0,2;0,0,0,1;0,-2,0,0];
B=[0,0;1,0;0,0;0,1];
C=[1,0,0,0;0,0,1,0];

A0=[0,1,0,0;0,0,-1,0;0,0,0,1;0,0,5,0];
B0=[0;1;0;-2];
C0=[1,0,0,0];

Ck=[B A*B A^2*B A^3*B];
rank(Ck)
ck=ctrb(A,B);
sistema=ss(A,B,C,0);
ctrb(sistema);

syms L
I=eye(4);
Hc=[L*I-A,B];
rank(Hc);

% Gc=gram(sistema,'c')

Ok=[C;C*A;C*A^2;C*A^3];
rank(Ok);
ok=obsv(A,C);
Ok=obsv(sistema);

% Gc=gram(sistema,'0')

Ck=[B0 A0*B0 A0^2*B0 A0^3*B0];
rank(Ck);
ck=ctrb(A0,B0);
sistema=ss(A0,B0,C0,0);
ctrb(sistema);

Hc=[L*I-A0,B0];
rank(Hc);
