clc
close all
clear all

m=1;
b=[6,2,6,2,6,2,-2,-2,-2,0,0,0];
k=[25,17,13,5,9,1,17,5,1,0,4,16];




dt=.01;
t=0:dt:10;
hold on
for i=1:12
Gs=tf([i],[m b(i) k(i)]);
figure,bode(Gs)
end
%figure,pzmap(Gs)
%plot(t,step(Gs,t))
%figure,plot(t,step(Gs,t))
%figure,bode(Gs)
