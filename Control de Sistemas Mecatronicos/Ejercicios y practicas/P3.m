clc
close all

k1=2;
k2=1;
k3=.5;
m1=10;
b1=.5;

A=[0,1,0;(-1/m1)*(k2+k1),0,k2/m1;k2/b1,0,-(k3+k2)/b1];
B=[0;1/m1;0];
C=[1,0,-1];
% U=sin(t);
vp=eig(A);
fil=size(A,2);

x0=[0;0;0];
syms s t
Us=1/((s*s)+1);
det=inv(s*eye(fil)-A);
Pa=ilaplace(det)*x0;
% Pb=ilaplace(det*B*(u/s));
Pb=ilaplace(det*B*(Us));
xt=Pa+Pb;
yt=C*xt
xtt=vpa(xt);
ytt=vpa(yt);