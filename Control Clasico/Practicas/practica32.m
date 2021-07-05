clc
clear all
close all

hold on
for k=1:.1:5
   
    Gs=tf([k k],[1 2+k k]);
    pzmap(Gs)
    axis([-5 5 -5 5])
    drawnow
    pause(.01)
end
hold off