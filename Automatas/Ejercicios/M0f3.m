clc
clear all
close all

Mq0=[1,0,0,1
    0,1,0,0
    0,0,1,2
    0,0,0,1];
Mqf=[0,-1,0,2
    0,0,1,1
    -1,0,1,1
    0,0,0,1];

M0=[Mq0(1,1:4),Mq0(2,1:4),Mq0(3,1:4)];
Mf=[Mqf(1,1:4),Mqf(2,1:4),Mqf(3,1:4)];

dt=.01;
vt0=0;
vtf=1;

t=vt0:dt:vtf;
L=length(t);
v=zeros(12,L);

for i=1:12
v(i,:)=int3(M0(i),Mf(i),0,0,vt0,vtf,dt);
end

MM=cell(1,L);

for i=1:L
MM{i}=[v(1:4,i)';v(5:8,i)';v(9:12,i)';0,0,0,1];
end
