clc
clear all
close all

A=[-5,6,-7,1,6,-3,1;
    -3,1,-4,2,-5,7,1;
    0,0,-6,12,-14,6,1;
    0,0,0,6,-14,11,-8;
    0,0,0,7,-8,4,-8;
    0,0,0,0,0,3,-8;
    0,0,0,0,0,4,-5];
B=[3;2;1;0;0;0;0];
C=[1,-1,1,0,-1,1,-1];
X0=[0;0;1;1;1;0;0];

L=size(B,1);

Lb=size(B,2);
Con=zeros(L,L*Lb);
for i=1:L
    Con(:,(1+((i-1)*Lb)):(Lb+((i-1)*Lb)))=A^(i-1)*B;
end
Q=Con;
disp(rank(Q))
Q(:,4)=[1;0;0;0;1;1;0];
Q(:,5)=[0;1;0;0;0;1;0];
Q(:,6)=[0;0;1;0;1;0;1];
Q(:,7)=[0;0;0;1;1;1;0];
rank(Q)
Qinv=inv(Q);

Ar=Qinv*A*Q;
Br=Qinv*B;
X0n=Q*X0;

A11=Ar(1:3,1:3);
B1=Br(1:3);

syms s k1 k2 k3

A=A11;
B=B1;
K=[k1,k2,k3];
L=size(B,1);
I=eye(L);
F=[-10,10,-10;0,-10,10;0,0,-10];
% disp(F)
Kr=ones(1,3)*(-10);

% Mobs=[Kr;Kr*F;Kr*F^2];
% rank(Mobs)

P=lyap(A,-F,-B*Kr);
Pinv=inv(P);
K=Kr*Pinv;
disp(K)
eig(A-B*K)
K=[K,0,0,0,0]
% 
% A=[-5,6,-7,1,6,-3,1;
%     -3,1,-4,2,-5,7,1;
%     0,0,-6,12,-14,6,1;
%     0,0,0,6,-14,11,-8;
%     0,0,0,7,-8,4,-8;
%     0,0,0,0,0,3,-8;
%     0,0,0,0,0,4,-5];
% B=[3;2;1;0;0;0;0];
% C=[1,-1,1,0,-1,1,-1];
% disp(round(eig(A-B*K)))

pol=expand((s-(-10))*(s-(-10))*(s-(-10)));
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

Kr=[G,0,0,0,0];
K=Kr*Qinv;
% K=round(K*10000)/10000;
A=[-5,6,-7,1,6,-3,1;
    -3,1,-4,2,-5,7,1;
    0,0,-6,12,-14,6,1;
    0,0,0,6,-14,11,-8;
    0,0,0,7,-8,4,-8;
    0,0,0,0,0,3,-8;
    0,0,0,0,0,4,-5];
B=[3;2;1;0;0;0;0];
C=[1,-1,1,0,-1,1,-1];
round(eig(A-B*K)*1000)/1000
