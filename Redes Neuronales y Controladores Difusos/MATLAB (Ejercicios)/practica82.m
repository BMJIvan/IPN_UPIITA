clc
clear all
close all

%E=[-360 -300 -200 -100 -50 -10 0 10 50 100 200 300 360];
%S=[-100 -90 -70 -50 -25 -5 0 5 25 50 70 90 100];
%datos=[E',S'];
%neuro ANFYS

x=-10:.1:10;
y=sinc(x);
datos=[x',y'];