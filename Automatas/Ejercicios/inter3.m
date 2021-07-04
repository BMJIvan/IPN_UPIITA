clc
close all
clear all

q0=0;%inicio
qf=3;%final
vt0=0;
vtf=1;
v0=0;
vf=0;
dt=.01;

M=[1,vt0,vt0^2,vt0^3
   0,1,2*vt0,3*vt0^2
   1,vtf,vtf^2,vtf^3
   0,1,2*vtf,3*vtf^2];

b=[q0;v0;qf;vf];

a=M\b;

t=vt0:dt:vtf;
L=length(t);
vec=zeros(1,L);

for i=1:L
vec(i)=a(1)+(a(2)*t(i))+(a(3)*t(i)^2)+(a(4)*t(i)^3);
end