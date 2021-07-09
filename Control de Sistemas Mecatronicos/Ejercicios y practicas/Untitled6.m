clc
clear all
close all

A=[0,1,0,0
   -9/50,0,9/50,0
   0,0,0,1
   1,0,-1,-1];
B=[0;1/50;0;0];
C=[1,0,0,0];
polos=[-3,-3,-3,-3];

K=zeros(4,4);
K(1,:)=KMD(A,B,polos);
K(2,:)=KFA(A,B,polos);
K(3,:)=KLy(A,B,polos);
K(4,:)=KFCC(A,B,polos);

L=zeros(4,4);
L(1,:)=LMD(A,C,polos);
L(2,:)=LFA(A,C,polos);
L(3,:)=LLy(A,C,polos);
L(4,:)=LFCO(A,C,polos);

disp(K)
disp(L)
