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
Av=[0,1,0,0,0,0;
  -k/m1,(-v2-v4-v1)/m1,k/m1,v2/m1,0,v4/m1
  0,0,0,1,0,0 
  k/m2,v2/m2,-k/m2,(-v2-v5)/m2,0,v5/m2
  0,0,0,0,0,1
  0,v4/m3,0,v5/m3,0,(-v4-v3-v5)/m3
    ];
Bv=[0;0;0;1/m2;0;0];
Cv=[0,0,0,1,0,0];


[nu,den]=ss2tf(Av,Bv,Cv,0);
tf(nu,den)
nu=roots(nu);
de=roots(den);

MP=11.5;
ts=.55;
mul=10;
n=size(Av,1);

lu=3;
le=length(de);

polosn(1:2)=RSL(MP,ts);
polosn(3)=nu(4);
polosn(4)=nu(5);
polosn(5)=nu(3);
polosn(6)=-mul*abs(polosn(1));

n=size(Bv,1);
Mcon=zeros(n,n);
for i=1:n
    Mcon(:,i)=(Av^(i-1)*Bv);
end
disp(rank(Mcon))
Q=Mcon(:,1:n-1);
Q(:,6)=[-1,1,-1,1,1,-1];
disp(rank(Q))
An=inv(Q)*Av*Q;
Bn=inv(Q)*Bv;

A=An(1:5,1:5);
B=Bn(1:5);
mat=zeros(4,5);
mat(1,:)=KMD(A,B,polosn);
mat(2,:)=KFA(A,B,polosn);
mat(3,:)=KLy(A,B,polosn);
mat(4,:)=KFCC(A,B,polosn);
eig(A-B*mat(1,:))

Kf=zeros(4,6);
Kf(1,:)=[mat(1,:),0]*inv(Q);
Kf(2,:)=[mat(2,:),0]*inv(Q);
Kf(3,:)=[mat(3,:),0]*inv(Q);
Kf(4,:)=[mat(4,:),0]*inv(Q);
% 
% n=size(Av,1);
% Mo=zeros(n,n);
% S=Mo;
% for i=1:n
%     Mo(i,:)=Cv*Av^(i-1);
% end
% disp(rank(Mo))