clc
clear all
close all

t0=0;
dt=.01;
tfi=10;
t=t0:dt:tfi;

m1=1;
m2=1;
g=9.81;
l=1;
B=1;

Kp=100;
Kd=10;
Ki=25;
F=[0;0];

SP=[3;0];

X(:,1)=[5;1.57];
Xp(:,1)=[0;0];
E(:,1)=[0;0]

for i=1:length(t)-1
M=[m1+m2,m2*l*cos(X(2,i));m2*l*cos(X(2,i)),m2*l^2];
C=[0,-m2*l*sin(X(2,i))*Xp(2,i);0,0];
G=[0;-m2*g*l*sin(X(2,i))];

E(:,1+i)=SP-X(:,i);
Ed(:,i)=(E(:,1+i)-E(:,i))/dt;
Ei(:,i)=sum(E*dt,2);
F=E(:,1+i)*Kp+Ed(:,i)*Kd+Ei(:,i)*Ki;

Xpp(:,i)=inv(M)*(F-C*Xp(:,i)-G-B*Xp(:,i));
Xp(:,i+1)=sum(Xpp*dt,2)+Xp(:,1);
X(:,i+1)=sum(Xp*dt,2)+X(:,1);
end
figure,plot(t,X(1,:))
figure,plot(t,X(2,:))

figure,
hold on
for i=1:2:length(t)-1
   cla
   area([X(1,i)-1,X(1,i)+1],[1,1])
   axis([-10 10 -10 10])
   plot([X(1,i),X(1,i)+l*sin(X(2,i))],[1,1+l*cos(X(2,i))])
   plot([X(1,i),X(1,i)+l*sin(X(2,i))],[1,1+l*cos(X(2,i))],'o')
   pause(dt)
end
hold off

