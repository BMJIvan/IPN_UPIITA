clc 
clear all 
close all

yp=[0 1.1 -.2 .1 .9 1 .1 -1.1 -.8 -.1 0];
y=yp;
u=[0 1 -1 1 1 1 -1 -1 0 0 0];
t=linspace(0,10,11);
plot(t,yp)
M=numel(yp);
M=[0,0
   1,0
  -1,1
   1,-1
   1,1
   1,1
   -1,1
   -1,-1
   0,-1
   0,0
   0,0];
theta=inv(M'*M)*M'*yp';
 B(1)=theta(1);
 B(2)=theta(2);
 A(1)=1;
 d=0;
 Hm=tf(B,A,1,'variable','z^-1');
 z=tf('z');
 Hm=Hm*z^-d

 [ym t]=lsim(Hm,u,t);
 hold on, plot(t,ym,'r')
 axis([0 10 -1.5 1.5])
 nf=(y'-ym);
 nf=[0,.4857,-1,0,-.2286,-.1286,.2,.0286,-.2857,-.1];
median(nf)
std(nf)
