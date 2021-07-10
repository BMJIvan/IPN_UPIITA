clc
clear all
close all

t=1:10;
yp=[1.1 -.2 .1 .9 1 0.1 -1.1 -.8 -.1 0];
u=[0 1 -1 1 1 1 -1 -1 0 0 0];
t=t';
yp=yp';
vo=yp;
u=u';

for k=1:10
phi(k,1)=u(k+1);
 phi(k,2)=u(k);
end
theta=inv(phi'*phi)*phi'*yp;
tm=1:10;
tm=tm';
ym=theta(1)*ones(length(tm),1);

for k=2:11
      ym(k-1)=theta(1)*u(k)+theta(2)*u(k-1);
end

plot(t,vo,'b',tm,ym,'k')
axis([0 10 -1.5 1.5])
a=theta(1)
b=theta(2)
nf=vo-ym
median(nf)
std(nf)
e=sum(abs(vo-ym))