clc
clear all
close all

FIS=readfis('E:\semestre 5\sistemas neurodifusos\matlab\practica6prueba.fis');
for n=-3.2:.001:3.2
u=int16(n*1000+3201);
val=evalfis(n,FIS);
trans(u)=val;
end
figure,plot(trans)
t0=0;
tf=10;
dt=.01;
t=t0:dt:tf;
m=1;
g=9.81;
l=1;
b=1;
tao=0;
T(1)=0;
Tp(1)=0;
SP=pi/2;
k=200;
kp=35;
ki=35;
% a=7.27;
SP=linspace(0,2*pi,1001);
    cla
for i=1:length(t)-1
    E(i+1)=7*(SP(i)-T(i));
    if E(i+1)>=3.2
        E(i+1)=3.2;
    end
    if E(i+1)<=-3.2
        E(i+1)=-3.2;
    end
    
    tao(i)=.42*trans(int16(E(i+1)*1000)+3201)/5;
    Tpp(i)=(tao(i)-Tp(i)*b-(m*g*l*sin(T(i))))/(m*l*l);
    Tp(i+1)=sum(Tpp*dt);
    T(i+1)=sum(Tp*dt);
  
end

 %figure,plot(1:length(tao)+1,E)
 plot(t,T)

 x=l*cos(T);
y=l*sin(T);
figure
for i=1:5:1000
cla
hold on

x=l*sin(T(i));
y=l*cos(T(i));
plot([0 x],[0 -y])
plot([0 x],[0 -y],'o')
axis([-3 3 -3 3])
pause(.0125)
end
hold off