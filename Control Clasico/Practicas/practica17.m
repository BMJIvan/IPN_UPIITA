clc
clear all
close all
t0=0;
tfi=10;
dt=.01;
t=t0:dt:tfi;
b=1;
m=1;
k=1;
l=1;
g=9.81;
T(1)=0;
Tp(1)=0;
tao=t;
%tao=ones(1,length(t));

for i=1:length(t)-1
    
    Tpp(i)=(tao(i)-b*Tp(i)-m*g*l*sin(T(i)))/(m*l*l);
    Tp(i+1)=sum(Tpp*dt);
    T(i+1)=sum(Tp*dt);
   
end
hold on
plot(t,T)

x1t=0;
x1=(-g/l)*cos(x1t);
A=[0,1;x1,-b/(m*l^2)];
B=[0;1/(m*l*l)];
C=[1,0];
D=[0];
Gs=ss(A,B,C,D);
%y=step(Gs,t);
y=lsim(Gs,tao,t);
plot(t,y,'bd')

Gs=tf([1],[m*l^2 b m*l*g]);
%y=step(Gs,t);
z=lsim(Gs,tao,t);
plot(t,z,'r*')