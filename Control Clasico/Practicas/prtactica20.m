clc
clear all
close all
dt=.01;
t=0:dt:10;

m1=1;
m2=m1;
m3=m2;
b=1;
g=9.81;
%SP=[theta1;theta2];
%SP=[th1;th2];
Kp=[20;20;20];
Kd=[30,0;0,30];
Ki=[30,0;0,30];
%Tao(:,1)=[0,0];
F=[0;0;0];
o=0:3/1001:3;
a=o.*sind((0:360/1001:360)*5);
b=o.*cosd((0:360/1001:360)*5);

Xp=[0;0;0];
X=[0;0;0];
%SP=[a;b;o.*ones(1,length(t)+1)];
SP=[a;b;b];
%SP=[1;0;1];
E=[0;0;0];
kp=50;
kd=50;
ki=100;



for i=1:length(t)-1
M=[m1+m2+m3,0,0;0,m2+m3,0;0,0,m3];

C=[0,0,0;0,0,0;0,0,0];

G=[0;0;-g];

E(:,i+1)=SP(:,i)-X(:,i);
Ed(:,i)=(E(:,i+1)-E(:,i))/dt;
Ei(:,i)=sum(E*dt,2);

F=kp*E(:,i+1)+kd*Ed(:,i)+ki*Ei(:,i);
Xpp(:,i)=inv(M)*(F-C*Xp(:,i)+G);
Xp(:,i+1)=sum(Xpp*dt,2);
X(:,i+1)=sum(Xp*dt,2);
end

hold on
x=[0 1 1 1]*X(1,1001);
y=[0 0 1 1]*X(2,1001);
z=[0 0 0 1]*X(3,1001);
plot3(x,y,z)
plot3(X(1,:),X(2,:),X(3,:))
axis([-10 10 -10 10 -10 10])


figure,
hold on
for i=1:length(t)-1
    cla
x=[0 1 1 1]*X(1,i);
y=[0 0 1 1]*X(2,i);
z=[0 0 0 1]*X(3,i);
plot3(x,y,z)
plot3(X(1,:),X(2,:),X(3,:))
    
    %plot3([x0 x1 x1 x1],[y0 y0 y0 y1],[z0 z0 z0 z1],'o')
    
    axis([-10 10 -10 10 -10 10])
    pause(dt)
end

hold off





