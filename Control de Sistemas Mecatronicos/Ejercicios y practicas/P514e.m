clc
clear all
close all

syms s k1 k2 k3

A=[5,1,1;-1,6,0;1,-1,5];
B=[0;1;1];
K=[k1,k2,k3];
L=size(B,1);
I=eye(L);
F=[-5,pi,-pi;0,-5,pi;0,0,-5];
disp(F)
Kr=ones(1,3)*(-5);

% Mobs=[Kr;Kr*F;Kr*F^2];
% rank(Mobs)

P=lyap(A,-F,-B*Kr);
Pinv=inv(P);
K=Kr*Pinv;
disp(K)
eig(A-B*K)

pol=expand((s-(-5))*(s-(-5))*(s-(-5)));
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