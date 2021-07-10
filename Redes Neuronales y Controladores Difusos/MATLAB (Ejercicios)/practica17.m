clc
close all
clear all

P=[0,0,1,1;0,1,0,1];
T=[0,0,1,1];
[NE,NP]=size(P);

w1=[2,2;-2/3,-2/3];
B1=[1;-1];
w2=[2/3,2/3];
B2=1;

for i=1:NP
a1=hardlim(w1*P(:,i)-B1);
a2=hardlim(w2*a1-B2)
end
