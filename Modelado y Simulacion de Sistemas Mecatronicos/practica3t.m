clc 
clear all 
close all
% J=3.2284e-6;
% B=3.5077e-6;
% k=.0274;
% L=275e-6;
% %R=4;
% R=.01;
% a=tf('s');
% H=(k)/((J*a+B)*(L*a+R)+k^2);
% %Ts=.005;
% Ts=.5e-4;
% %t=0:Ts:.12;
% t=0:Ts:10e-3;
% %u=ones(numel(t),1);
% u=cos(2*pi*t*100);
% [yp t]=lsim(H,u,t);
% yp=yp+.2*randn(numel(t),1);
yp=[0 1.1 -.2 .1 .9 1 .1 -1.1 -.8 -.1 0];
y=yp;
u=[0 1 -1 1 1 1 -1 -1 0 0 0];
t=0:10;
%plot(t,yp)
M=numel(yp);
 
 d=0;
 m=1;
 N=numel(yp);
 M=[];
 for k=m+d+1:N
         My=-yp(k-1);
        Mu=u(k-d-1);
        for i=2:m
            My=[My -yp(k-i)];
            Mu=[Mu u(k-d-i)];
        end
        M=[M; My Mu];
end
yp=yp(m+d+1:N);
theta=inv(M'*M)*M'*yp';

 B(1)=theta(1);
 B(2)=theta(2);
 A(1)=1;
 
% for i=1:m
 %A(i+1)=theta(i);
 %B(i+1)=theta(m+i);
 %end
 Hm=tf(B,A,1,'variable','z^-1');
 z=tf('z');
 Hm=Hm*z^-d

 [ym t]=lsim(Hm,u,t);
 hold on, plot(t,ym,'r')
 e=sum(abs(y'-ym))