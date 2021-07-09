clc
close all
clear all

syms s Ll

polos=[-10,-5+(5*sqrt(3))*i,-5-(5*sqrt(3))*i];
A=[0,1,0;0,0,1;1.244,.3956,-3.145];
B=[0;0;1.244];
C=[1,0,0];

L=size(B,1);
I=eye(L);

pol=s-polos(1);
for i=2:L
   pol=pol*(s-polos(i)); 
end
pol=expand(pol);

ar=sym(zeros(1,L));
ar(L)=subs(pol,s,0);
npol=pol-ar(L);

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
ar(k)=nnpol;
end

Mo=zeros(L,L);
for i=1:L
    Mo(i,:)=C*A^(i-1);
end
Moinv=inv(Mo);

PobsA=A^L;
for i=1:L
PobsA=PobsA+ar(i)*A^(L-i);
end
th=zeros(L,1);
th(L)=1;

Ll=PobsA*Moinv*th;
disp(Ll)
eig(A-Ll*C)
round(eig(A-Ll*C)*10000)./10000
