clc
clear all
close all

q0=1;
qf=1.1;
t0=0;
tf=1;
dt=.01;

if(qf<q0)
    qf=qf+2*abs(qf-q0);
    vol=true;
else
    vol=false;
end

Vtb=abs(1.5*((qf-q0)/tf));
tb=abs(((q0-qf)/(Vtb))+tf);
al0=q0;
a=Vtb/tb;
al2=a/2;
t1=t0:dt:tb;
qt1=al0+(al2*t1.^2);

B1=Vtb;
B0=(q0+qf-(Vtb*tf))/2;

tff=tf-tb;
t2=tb+dt:dt:tff;
qt2=B0+(B1*t2);

g2=-Vtb/(2*tb);
g1=(Vtb*tf)/tb;
g0=qf-((Vtb*tf^2)/(2*tb));

t00=(tf-tb+dt);
t3=t00-dt:dt:tf;
qt3=g0+(g1*t3)+(g2*t3.^2);

if(vol==false)
    qtf=[qt1,qt2,qt3];
else
    qtf=[qt1,qt2,qt3];
    qtf=2*q0-qtf;
end