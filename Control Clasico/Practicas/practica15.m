clc
clear all
close all

x=5:.5:7;
y=10:.5:12;

[X,Y]=meshgrid(x,y);
Z=X.*Y;


Z1=66+6*(Y-11)+11*(X-6);

surf(X,Y,Z)
hold on

surf(X,Y,Z1)
hold off

