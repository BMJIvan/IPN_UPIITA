clc
clear all
close all

num=[0,1,1,0];
den=[1,8,12,6];
[r,p,k]=residue(num,den);

A=[0,1,0
   0,0,1
   -6,-12,-8];
B=[0;0;1];
C=[0,1,1];

syms x10 x20 x30 u0 u1 u2

% y1=2;
% y2=1;
% y3=2;
% y4=2;


x11=x20;
x21=x30;
x31=(-6*x10)+(-12*x20)+(-8*x30)+u0;

x12=x21;
x22=x31;
x32=(-6*x11)+(-12*x21)+(-8*x31)+u1;

y0=x20+x30;
y1=x21+x31;
y2=x22+x32;

y00=1;
y11=-1;
y22=2;

ecu=[0,1,1
     -6,-12,-7
     42,78,44];
res=[y00,y11-u0,y22-u1+(7*u0)];
res=subs(res,{u0,u1,u2},{0,1,2});

detp=det(ecu);
X=zeros(1,3);
for i=1:3
    ecui=ecu;
    ecui(:,i)=res;
    X(i)=det(ecui)/detp;
end

I=eye(size(A,1));
syms z k
X0=[-1.8333;1;0];
Q=inv(z*I-A);
U=(z/((z-1)^2));
Xk=(iztrans(Q*z,z)*X0)+iztrans(Q*B*U,z);
Xk=subs(Xk,z,k);
Xk=vpa(Xk);

polos=[0,0,0];
mat=zeros(4,3);
mat(1,:)=KMD(A,B,polos);
mat(2,:)=KFA(A,B,polos);
mat(3,:)=KLy(A,B,polos);
mat(4,:)=KFCC(A,B,polos);

L=zeros(3,4);
L(:,1)=LMD(A,C,polos);
L(:,2)=LLy(A,C,polos);
L(:,3)=LFCO(A,C,polos);
L(:,4)=LFA(A,C,polos);
