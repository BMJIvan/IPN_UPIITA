clc
clear all
close all

R=1e5;
c=1e-6;
a=tf('s')
H=1/(R*c*a+1);
T=.005;
t=0:T:1;
[vo t]=step(H,t);
vo=vo+rand(length(t),1)*.01;

yp=vo;
u=t;
q=4;
phi=ones(length(t),1);

for v=1:q
    phi=[phi u.^v];
end

theta=inv(phi'*phi)*phi'*yp;
tm=0:0.001:1;
tm=tm';
ym=theta(1)*ones(length(tm),1);

for v=2:q+1
    ym=ym+theta(v)*tm.^(v-1);
end
    
plot(t,vo,'.b',tm,ym,'k')