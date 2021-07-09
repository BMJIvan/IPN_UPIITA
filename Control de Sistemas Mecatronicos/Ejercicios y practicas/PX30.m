clc
close all
clear all

ti=0;
dt=1;
tf=10;
t=ti:dt:tf;

x=zeros(1,length(t));

for i=2:length(t)
   cla
   x(i)=x(i-1)+1;
   plot(t,x)
   pause(dt)
end