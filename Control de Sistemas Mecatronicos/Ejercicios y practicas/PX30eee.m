clc
clear all
close all

num=[0,1,1];
den=[1,5,6];
[r,p,k]=residue(num,den);

A=[-2,0;0,-3];
B=[1;1];
C=[-1,2];

syms x10 x20 u0 u1

x11=-2*x10+u0;
x21=-3*x20+u0;

y1=-x10+(2*x20);
y2=-x11+(2*x21);

ecu=[-1,2;2,-6];
res=[2,1-u0];
res=subs(res,u0,sin(0));

detp=det(ecu);
X=zeros(1,2);
for i=1:2
    ecui=ecu;
    ecui(:,i)=res;
    X(i)=det(ecui)/detp;
end
