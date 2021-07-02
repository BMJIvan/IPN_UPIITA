clc
clear all
close all


grados=180/pi;
rad=pi/180;

h=1;
B=120;
wrpm=200;
Rb=1;
w=(wrpm/60)*2*pi;
u=0:.05:1;
y=1:21;


%cicloidal
for n=1:21
y(n)=h*(u(n)-((1/(2*pi))*sin((2*pi*grados)*u(n)*rad)));
end
subplot(5,5,1)
grid on
plot(u,y)

for n=1:21
v(n)=(h*w/(B*rad))*(1-cos((2*pi*grados)*u(n)*rad));
end
subplot(5,5,6)
plot(u,v)

for n=1:21
a(n)=(2*pi*h*w^2/(B*rad)^2)*sin((2*pi*grados)*u(n)*rad);
end
subplot(5,5,11)
plot(u,a)

for n=1:21
sa(n)=4*h*pi^2*((w/(B*rad))^3)*cos((2*pi*grados)*u(n)*rad);
end
subplot(5,5,16)
plot(u,sa)

for n=1:21
r=Rb+y(n);
q=v(n)/w;
ang(n)=grados*atan((q/r));
end
subplot(5,5,21)
plot(u,ang)



%Armonico
for n=1:21
y(n)=(h/2)*(1-cos((pi*grados)*u(n)*rad));
end
subplot(5,5,2)
plot(u,y)

for n=1:21
v(n)=((pi*h*w)/(2*B*rad))*sin((pi*grados)*u(n)*rad);
end
subplot(5,5,7)
plot(u,v)


for n=1:21
a(n)=((h*(pi*w)^2)/(2*(B*rad)^2))*(cos((pi*grados)*u(n)*rad));
end
subplot(5,5,12)
plot(u,a)


for n=1:21
sa(n)=-((h*pi^3)/2)*((w/(B*rad))^3)*sin((pi*grados)*u(n)*rad);
end
subplot(5,5,17)
plot(u,sa)


for n=1:21
r=Rb+y(n);
q=v(n)/w;
ang(n)=grados*atan((q/r));
end
subplot(5,5,22)
plot(u,ang)




%polinomial
for n=1:21
y(n)=(10*h*(u(n)^3))-(15*h*(u(n)^4))+(6*h*(u(n)^5));
end
subplot(5,5,3)
plot(u,y)


for n=1:21
v(n)=(30*w*h/(B*rad))*((u(n)^2)-(2*(u(n)^3))+(u(n)^4));
end
subplot(5,5,8)
plot(u,v)


for n=1:21
a(n)=(60*h*(w/(B*rad))^2)*((u(n))-(3*(u(n)^2))+(2*(u(n)^3)));
end
subplot(5,5,13)
plot(u,a)


for n=1:21
sa(n)=(60*h*(w/(B*rad))^3)*((1)-(6*(u(n)))+(6*(u(n)^2)));
end
subplot(5,5,18)
plot(u,sa)


for n=1:21
r=Rb+y(n);
q=v(n)/w;
ang(n)=grados*atan((q/r));
end
subplot(5,5,23)
plot(u,ang)

%velocidad_constante

for n=1:21
y(n)=h*u(n);
end
subplot(5,5,4)
plot(u,y)


for n=1:21
v(n)=w*(h/(B*rad));
end
subplot(5,5,9)
plot(u,v)


for n=1:21
a(n)=0;
end
subplot(5,5,14)
plot(u,a)


for n=1:21
sa(n)=0;
end
subplot(5,5,19)
plot(u,sa)


for n=1:21
r=Rb+y(n);
q=v(n)/w;
ang(n)=grados*atan((q/r));
end
subplot(5,5,24)
plot(u,ang)




%parabolica

for n=1:11
y(n)=2*h*(u(n))^2;
end

for n=12:21
y(n)=h*(1-2*((1-u(n))^2));
end
subplot(5,5,5)
plot(u,y)


for n=1:11
v(n)=(4*h*w/B)*u(n);
end

for n=12:21
v(n)=(4*h*w/B)*(1-u(n));
end
subplot(5,5,10)
plot(u,v)


for n=1:11
a(n)=4*h*(w/B)^2;
end

for n=12:21
a(n)=-4*h*(w/B)^2;
end
subplot(5,5,15)
plot(u,a)


for n=1:21
sa(n)=0;
end
subplot(5,5,20)
plot(u,sa)

for n=1:21
r=Rb+y(n);
q=v(n)/w;
ang(n)=grados*atan((q/r));
end
subplot(5,5,25)
plot(u,ang)