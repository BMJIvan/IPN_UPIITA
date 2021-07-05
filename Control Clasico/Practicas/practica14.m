clc
clear all
close all

t0=0;
dt=.01;
tf=6;
t=t0:dt:4;
a=2.5;
%xt=(t.^4)-(5*t.^3)-(10*t.^2)+(4*t)-10;
xt=exp(t);
dxt=derivada(xt,dt);
% ddxt=derivada(dxt,dt);
% dddxt=derivada(ddxt,dt);
% ddddxt=derivada(dddxt,dt);
for i=1:length(xt)
   if t(i)==a
      fa=xt(i) 
      dfa=dxt(i)
%       ddfa=ddxt(i)
%       dddfa=dddxt(i)
%       ddddfa=ddddxt(i)
   
   end
end
%fst=fa*ones(1,length(t))+dfa*(t-a)+(ddfa*(t-a).^2)/2+(dddfa*(t-a).^3)/6+(ddddfa*(t-a).^4)/24;
fst=fa*ones(1,length(t))+dfa*(t-a);
xtt=12.1825+12.1825*(t-2.5);
hold on
plot(t,xt)
%plot(t,fst,'r')
plot(t,xtt)
hold off
% 
% c=0:.1:2*pi;
% g=sin(c);
% r=.9917-.1288*(c-1.7);
% hold on
% plot(t,c)
% plot(t,r)
% hold off
