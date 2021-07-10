clc
clear all
close all

FIS=readfis('E:\semestre 5\sistemas neurodifusos\matlab\practica10.fis');

t=-25:25;

for i=-25:25;
    
    a=evalfis(i,FIS);
    graf1(i+26)=a(1);
    graf2(i+26)=a(2);
    
end

hold on
plot(t,graf1)
plot(t,graf2)

 t1=table(graf1');
 t2=table(graf2');
 ruta1='E:\semestre 5\sistemas neurodifusos\matlab\tiz.txt';
 ruta2='E:\semestre 5\sistemas neurodifusos\matlab\tde.txt';
 writetable(t1,ruta1);
 writetable(t2,ruta2);
