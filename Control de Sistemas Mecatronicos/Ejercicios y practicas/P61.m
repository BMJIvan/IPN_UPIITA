clc
close all
clear all

m1=10;
k1=2;
k2=1;
k3=.5;
b1=.5;

A=[0,1,0;-(k1+k2)/(m1),0,(k2)/(m1);(k2)/(b1),0,-(k2+k3)/(b1)];
B=[0;1/m1;0];


syms s k1 k2 k3

K=[k1,k2,k3];
L=size(B,1);
I=eye(L);

pol=expand((s-(-3+2j))*(s-(-3-2j))*(s-(-3)));
a=sym(zeros(1,L));
a(L)=subs(pol,s,0);
npol=pol-a(L);

for k=1:L-1
nnpol=npol;
cont=L-k;
for i=L:-1:1
    if i==cont
        nnpol=subs(nnpol,s^i,1);
    else
        nnpol=subs(nnpol,s^i,0);
    end
end
a(k)=nnpol;
end

Lb=size(B,2);
Con=zeros(L,L*Lb);
for i=1:L
    Con(:,(1+((i-1)*Lb)):(Lb+((i-1)*Lb)))=A^(i-1)*B;
end
Coninv=inv(Con);

PLC=A^L;
for i=2:L
PLC=PLC+A^(L+1-i)*a(i-1);
end
PLCA=PLC+a(L)*I;

vec=zeros(1,L);
vec(L)=1;
G=vec*Coninv*PLCA;
disp(G)
eig(A-B*G)