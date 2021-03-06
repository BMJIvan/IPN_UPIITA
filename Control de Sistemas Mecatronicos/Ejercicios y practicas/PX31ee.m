clc
close all
clear all

num=[0,1,2,0,0];
den=[1,1,-9,11,-4];
[r,p,k]=residue(num,den);

A=[1,1,0,0
    0,1,1,0
    0,0,1,0
    0,0,0,-4];
B=[0;0;1;1];
C=[.6,1.28,.744,.256];

u0=sin(0);
u1=sin(1);
u2=sin(2);

x10=1;
x20=2;
x30=-1;
x40=-3;

x11=x10+x20;
x21=x20+x30;
x31=x30+u0;
x41=-4*x40+u0;

x12=x11+x21;
x22=x21+x31;
x32=x31+u1;
x42=-4*x41+u1;

x13=x12+x22;
x23=x22+x32;
x33=x32+u2;
x43=-4*x42+u2;

X1=[x10;x20;x30;x40];
X2=[x11;x21;x31;x41];
X3=[x12;x22;x32;x42];
X4=[x13;x23;x33;x43];

ree(1)=C*X1;
ree(2)=C*X2;
ree(3)=C*X3;
ree(4)=C*X4;