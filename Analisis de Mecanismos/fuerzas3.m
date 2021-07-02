clc
close all
clear all
format long

grados=180/pi;
rad=pi/180;
ab=.12;
cd=.38;
h=.2;
d=.42;
t2=60*rad;
w2=-110;
Fe=-400;

t3=atan((ab*sin(t2))/(ab*cos(t2)+h));
cb=(ab*sin(t2))/(sin(t3));
w3=(ab*cos(t2)*w2)/(cb*cos(t3));
Tc=(-cd*cos(t3)*Fe);
T=-(Tc*w3)/(w2)