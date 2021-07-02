clc
close all
clear all

grados=180/pi;
rad=pi/180;
B=45;
w=100;
w=100;

theta=0:10:360;
wx1=0:36;
wy1=0:36;
wx2=0:36;
wy2=0:36;
wo=0:36;
for n=1:37
t1=theta(n)*rad;  
t2=B*rad;    
wo=w*((cos(t2))/(1-(sin(t2)^2)*(cos(t1)^2)));

wx1(n)=w*cos(t1);
wy1(n)=w*sin(t1);

wx2(n)=wo*cos(-t1+pi/2);
wy2(n)=wo*sin(-t1+pi/2);
end

plot(wx1,wy1)
hold on
plot(wx2,wy2)