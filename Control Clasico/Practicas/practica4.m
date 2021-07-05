clc
clear all
close all

t0=0;
dt=.01;
tfl=10;
t=t0:dt:tfl;

r=1;
c=1;
%vt=1;
%2
vt=1/dt;
vc(1)=0;

for i=1:length(t)-1
vcp(i)=(vt-vc(i))/(r*c);
vc(i+1)=sum(vcp*dt);
%2
vt=0;
end

gs=tf([1],[r*c 1]);
%y=step(gs,t);
y=impulse(gs,t);
y1=1-exp((-1/(r*c)*t));
%y1=dferivada de arriba

hold on
plot(t,vc)
plot(t,y,'r');
%plot(t,y1,'*')

