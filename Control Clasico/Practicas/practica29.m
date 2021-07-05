clc
clear al
close all

tfi=30;
dt=.01;
t0=0;
t=t0:dt:tfi;
H=tf([1],[1 6 5 .7]);

hold on
y=step(H,t);
dy=derivada(y,dt);
ddy=derivada(dy,dt);
[m p]=max(dy);
recta=m*(t-t(p))+y(p);

for i=1:length(t)
if recta(i)<=0
  L=t(i);  
end
    if recta(i)<=max(y)
        T=t(i)-L;
    end
end

Kp=(T/L)*1.2;
Ti=2*L;
Ki=Kp/Ti;
Td=.5*L;
Kd=Kp*Td;
hold on
plot(t,y)
plot(t,dy,'r')
%plot(t,ddy)
plot(t,recta,'k')
axis([0 15 0 2])


