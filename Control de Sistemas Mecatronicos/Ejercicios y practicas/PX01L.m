clc
clear all
close all

m1=2;
m2=1;
m3=1;
v1=1;
v2=1;
v3=1;
v4=1;
v5=1;
k=2;

A=[0,1,0,0,0,0;
  -k/m1,(-v2-v4-v1)/m1,k/m1,v2/m1,0,v4/m1
  0,0,0,1,0,0 
  k/m2,v2/m2,-k/m2,(-v2-v5)/m2,0,v5/m2
  0,0,0,0,0,1
  0,v4/m3,0,v5/m3,0,(-v4-v3-v5)/m3
    ];
B=[0;0;0;1/m2;0;0];
C=[0,0,0,0,1,0];
polos=[-5,-5,-5,-5,-5];

n=size(B,1);
I=eye(n);

Mo=zeros(n,n);
for i=1:n
    Mo(i,:)=C*A^(i-1);
end
S=Mo;
r=n-rank(Mo);

S(5,:)=[0,0,0,1,1,0];
S(6,:)=[-1,0,0,1,-1,0];
Sinv=inv(S);

An=S*A*Sinv;
Bn=S*B;
Cn=C*Sinv;

le=n-r;
A11=An(1:le,1:le);
C1=Cn(1:le);
L1=LLy(A11,C1,polos(1:n-r));
Lr=[L1;zeros(r,1)];
L=Sinv*Lr;
eig(A-L*C)
