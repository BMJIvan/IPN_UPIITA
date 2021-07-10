clc
close all
clear all

P=[0,0,1,1;0,0,0,0];
%T=[0,0,1,1];%buffer
T=[1,1,0,0];%not
[NE,NP]=size(P);

 %w=[2 .00001];%buffer
% b=1;
w=[-2 .00001];%not
b=-1;
x1=-5:.1:5;
x2=(b-w(1,1)*x1)/(w(1,2));

hold on
for i=1:NP
n=w*P(:,i)-b;
a(i)=hardlim(n);
end

for i=1:NP
    if T(i)==0
        plot([P(1,i)],[P(2,i)],'ro')
    else
         plot([P(1,i)],[P(2,i)],'bo')
    end
end     
plot(x1,x2)
hold off
axis([-5 5 -5 5])