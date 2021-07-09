clc
clear all
close all

syms s k1 k2 k3
%3 forma canocnica

A=[0,1,-1;0,1,2;5,3,-1];
B=[0;0;1];
K=[k1,k2,k3];
L=size(B,1);
I=eye(L);

pol=det(s*I-A);
a=zeros(1,L);
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

Cri=zeros(L);
vec=[1,a(1:(L-1))];
for i=1:L
   Cri(i,:)=vec;
   for n=L-1:-1:1
       vec(n+1)=vec(n);
   end
   vec(1)=0;
end

Lb=size(B,2);
Con=zeros(L,L*Lb);
for i=1:L
    Con(:,(1+((i-1)*Lb)):(Lb+((i-1)*Lb)))=A^(i-1)*B;
end

pol=expand((s-(-4+2j))*(s-(-4-2j))*(s-(-10)));
an=sym(zeros(1,L));
an(L)=subs(pol,s,0);
npol=pol-an(L);

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
an(k)=nnpol;
end
Kr=an-a;

Pinv=Con*Cri;
P=inv(Pinv);
K=Kr*P;
disp(K)
eig(A-B*K)