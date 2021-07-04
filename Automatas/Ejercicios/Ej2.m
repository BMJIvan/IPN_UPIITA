clc
close all
clear all


T1 = transl(0, 0, 2);
tranimate(T1)
axis([-4 4 -4 4 -4 4])
hold on
T2=troty(-90)*T1;
tranimate(T1,T2)

T3=trotz(90)*T2;
tranimate(T2,T3)

T4=T3*transl(1,0,0);
tranimate(T3,T4)

T5=trotx(-90)*T4;
tranimate(T4,T5)

T6=T5*transl(2,0,-1);
tranimate(T5,T6)