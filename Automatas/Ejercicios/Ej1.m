clc
clear all
close all

T1=transl2(1,2);
axis([0 6 -5 5]);% se genera la gráfica
grid on
hold on
trplot2(T1, 'frame', '1', 'color', 'b') 

T2=trot2(-90,'deg')*T1
trplot2(T2, 'frame', '2', 'color', 'k') 

T3=T2*transl2(0,1)
trplot2(T3, 'frame', '3', 'color', 'c') 

T4=transl2(1,0)*T3
trplot2(T4, 'frame', '4', 'color', 'r')

T5=T4*trot2(-90,'deg')
trplot2(T5, 'frame', '5', 'color', 'b') 

