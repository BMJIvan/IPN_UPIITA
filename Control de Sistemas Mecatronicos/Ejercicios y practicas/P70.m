clc
clear all
close all

A=[0,-1,0,0,-4;0,0,1,0,1;0,1,0,0,2;-2,1,0,-2,4;0,0,0,0,-2];
B=[0;1;0;0;0];


L=size(B,1);

Lb=size(B,2);
Con=zeros(L,L*Lb);
for i=1:L
    Con(:,(1+((i-1)*Lb)):(Lb+((i-1)*Lb)))=A^(i-1)*B;
end
disp(Con)
% rank(A)

Q=[0,-1,0,1,0;1,0,0,0,0;0,1,0,0,1;0,1,0,0,0;0,0,1,0,0];
disp(Q)
% rank(Q)
% det(Q)
Qinv=inv(Q);

Ar=Qinv*A*Q;
Br=Qinv*B;

A11=Ar(1:2,1:2)
B1=Br(1:2)

syms s k1 k2 k3

A=A11;
B=B1;
K=[k1,k2];
L=size(B,1);
I=eye(L);
F=[-4,pi;0,-4,];
% disp(F)
Kr=ones(1,2)*(-4);

% Mobs=[Kr;Kr*F;Kr*F^2];
% rank(Mobs)

P=lyap(A,-F,-B*Kr);
Pinv=inv(P);
K=Kr*Pinv;
disp(K)
eig(A-B*K)

pol=expand((s-(-4))*(s-(-4)));
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

Kr=[G,0,0,0]
K=Kr*Qinv