clc
close all
clear all

m=1;
b=1;
k=1;

A=[0,1;-k/m,-b/m];
B=[0;1/m];
C=[1,0;0,0];
D=[0;0];

E=[1,1,1
   2,2,2
   3,3,3]