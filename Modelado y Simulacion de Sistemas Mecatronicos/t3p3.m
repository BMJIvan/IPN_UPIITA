close all
clear all

r1=10;
r2=100;
r3=20;
c=.04;
l=2.5;



%Gs=tf([a*b (a+b) 1],[1 0]);

for i=.5:.2:1.5
    for j=.2:.2:1.2

Gs=tf([i*j (i+j) 1],[1 0]);
hold on
pzmap(Gs)
axis([-2 2 -2 2])
    end
end