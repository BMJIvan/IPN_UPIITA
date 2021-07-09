clc
clear all
close all

A=[0,1;-550/1300,-4000/1300];
B=[0;10/1300];
C=[1/10,0];

L=2;

syms s k1 k2

K=[k1,k2];
L=size(B,1);
I=eye(L);

pol=expand((s-(-5))*(s-(-5)));
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

K=[ 3195, 900];

