clc
clear all
close all
m=2;
b=.25;
k=1;


A=[0,1;-k/m,-b/m];
B=[0;1/m];
C=[1,0
   0,1
   -k/m,-b/m
   k,0
   0,b];
D=[0
   0
   1/m
   0
   0];
sis=ss(A,B,C,D);
impulse(sis)
