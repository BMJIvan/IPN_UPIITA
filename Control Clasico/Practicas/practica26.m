clc
clear all
close all
dt=.01;
t=0:dt:10;

m1=1;
m2=m1;
l=1;
b=1;
g=9.81;

VECA=[0.001,.67,1.18,1.58,1.9,2.2,2.45,2.69,2.87,2.97,3.04,3,2.86,2.45,1.77,.74,.14,-.17,-.29,-.30,-.25,-.15,.02,.19,.33,.43,.41,.08,-.25,-.32,-.08,.07,.32,.53,.73,.86,.94,.9,.84,.68,.51,.35,.21,.06,-.09,-.19,-.34,-.45,-.5,-.53,-.52,-.43,-.3,-.04];
xa=0:27;
  xb=25:-1:0;
  xx=[xa,xb];
  yy=VECA/10;
  xx=(xx+15)/10;
  yy=yy;
F=[0;0];
for i=1:length(xx)

theta(i)=atan2(yy(i),xx(i));
xf(i)=(xx(i)/cos(theta(i)))-l;
end
for i=1:length(xx)
xyy(i)=(l+xf(i))*sin(theta(i));
end

Xp=[0;0];
X=[0;0];

SP=[xf;theta];

E=[0;0];
kp=[25;1000];
kd=[25;500];
ki=[20;2000];

a=1;
b=1;
for i=1:length(t)-1

if b>=19
b=1;
a=a+1;
end

if a>=54
a=54;
end

M=[m2,0;0,m1*l^2+m2*l^2+m2*l*X(1,i)+m2*X(l,i)^2];
C=[0,-l*m2*Xp(2,i)-2*m2*X(1,i);m2*l*Xp(2,i)+2*m2*X(1,i)*Xp(2,i),0];
G=[g*sin(X(2,i))*m2;g*cos(X(2,i))*m1*l+g*cos(X(2,i))*m2*(l+X(1,i))];

E(:,i+1)=SP(:,a)-X(:,i);
Ed(:,i)=(E(:,i+1)-E(:,i))/dt;
Ei(:,i)=sum(E*dt,2);
 
F=kp.*E(:,i+1)+kd.*Ed(:,i)+ki.*Ei(:,i);
%F=[0;0]; 
Xpp(:,i)=inv(M)*(F-C*Xp(:,i)-G-b*Xp(:,i));
Xp(:,i+1)=sum(Xpp*dt,2);
X(:,i+1)=sum(Xp*dt,2);

b=b+1;
end 
% plot(t,X(1,:))
% figure,plot(t,X(2,:))

figure,
hold on

for i=10:2:length(t)
    cla
    x0=0;
    y0=0;
    x1=l*cos(X(2,i));
    y1=l*sin(X(2,i));
    
    x2=(l+X(1,i))*cos(X(2,i));
    y2=(l+X(1,i))*sin(X(2,i));
    sx2(i)=x2;
    sy2(i)=y2;
    plot(sx2,sy2,'o')
    plot([x0 x1 x2],[y0 y1 y2])
    plot([x0 x1 x2],[y0 y1 y2],'o')
    plot(xx,yy)
    axis([-.5 4.5 -.6 .6])
    %axis([-2.5 1 -20 1])
    pause(dt)
end

hold off
