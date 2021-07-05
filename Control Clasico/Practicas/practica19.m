clc
clear all
close all

tf0=0;
tfi=46;
dt=.01;

t=tf0:dt:tfi;

b=1;
m1=1;
m2=1;
l1=1;
l2=1;
g=9.81;

T(:,1)=[0;0];
Tp(:,1)=[0;0];
%%%%
r=.5;
cx=1;
cy=1;
ang=0:.1:360;
px0=2;
py0=0;
vx=px0*ones(1,4600);
vy=py0*ones(1,4600);

ry=py0:(cy-py0)/500:cy;
rx=r+cx:(px0-cx-r)/500:px0;

for i=1:500
   vx(i+500)=rx(501-i);
   vy(i+500)=ry(i);
end

for i=1:length(ang)-1
   vx(i+1000)=cx+r*cosd(ang(i));
   vy(i+1000)=cy+r*sind(ang(i));
end

for i=1:4600
th2(i)=acos((vx(i)^2+vy(i)^2-l1^2-l2^2)/(2*l1*l2));
th1(i)=atan2(vy(i),vx(i))-asin((l2*sin(th2(i)))/(sqrt(vx(i)^2+vy(i)^2)));  

end
%%%%
px=2;
py=0;

theta2=acos((px^2+py^2-l1^2-l2^2)/(2*l1*l2));
theta1=atan2(py,px)-asin((l2*sin(theta2))/(sqrt(px^2+py^2)));

%SP=[theta1;theta2];
SP=[th1;th2];
Kp=[70,0;0,70];
Kd=[30,0;0,30];
Ki=[30,0;0,30];
%Tao(:,1)=[0,0];
Tao=[0;0];
for i=1:length(t)-1

M11=(m1*l1^2)+(m2*l1^2)+(m2*l2^2)+(2*m2*l1*l2*cos(T(2,i)));
M12=(m2*l2^2)+(m2*l1*l2*cos(T(2,i)));
M21=M12;
M22=(m2*l2^2);

M=[M11,M12;M21,M22];

C11=(-2*m2*l1*l2*Tp(2,i)*sin(T(2,i)));
C12=(-m2*l1*l2*sin(T(2,i)*cos(T(2,i))));
C21=(-m2*l1*l2*Tp(2,i)*sin(T(2,i)))+(m2*l1*l2*Tp(1,i)*sin(T(2,i)));
C22=(m2*l1*l2*Tp(1,i)*sin(T(2,i)));

C=[C11,C12;C21,C22];

g1=(g*l1*cos(T(1,i))*(m1+m2))+(m2*g*l2*cos(T(1,i)+T(2,i)));
g2=(m2*g*l2*cos(T(1,i)+T(2,i)));

G=[g1;g2];

E(:,i+1)=SP(:,i)-T(:,i);
%E(:,i+1)=SP-T(:,i);

Ed(:,i)=(E(:,i+1)-E(:,i))/dt;
Ei(:,i)=sum(E*dt,2);
Tao=Kp*E(:,i+1)+Kd*Ed(:,i)+Ki*Ei(:,i);
Tpp(:,i)=inv(M)*(Tao-C*Tp(:,i)-G-(b*Tp(:,i)));
%Tpp(:,i)=inv(M)*(Tao-C*Tp(:,i)-G);
Tp(:,i+1)=sum(Tpp*dt,2);
T(:,i+1)=sum(Tp*dt,2);
end

plot(t,T(1,:))
figure,plot(t,T(2,:))

a=cx+r*sind(0:360);
b=cy+r*cosd(0:360);
ncx=(r+cx)*ones(1,4600);
ncy=1*ones(1,4600);
cont=1;
figure,
hold on
for i=1:10:length(t)
    cla
    x0=0;
    y0=0;
    x1=l1*cos(T(1,i));
    y1=l1*sin(T(1,i));
    
    x2=x1+l2*cos(T(1,i)+T(2,i));
    y2=y1+l2*sin(T(1,i)+T(2,i));
    
    plot([x0 x1 x2],[y0 y1 y2])
    plot([x0 x1 x2],[y0 y1 y2],'o')
    
    
    plot(a,b)
    if i>1000
        ncx(cont)=x2;
        ncy(cont)=y2;
        cont=cont+1;
    end
    plot(ncx,ncy,'r')
    axis([-4 4 -4 4])
    pause(dt)
end

hold off




