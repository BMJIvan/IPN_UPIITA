clc
close all
clear all

FIS=readfis('E:\semestre 5\sistemas neurodifusos\practica1f.fis')
t=0:100;
v=evalfis(t,FIS);
plot(t,v)