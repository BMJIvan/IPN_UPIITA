                          clc
clear all
close all

% a=tf([1],[1]);
% subplot(1,3,1)
% bode(a)


for tao=.1:.1:10
    cla
a=tf([10],[tao 1 1]);
%subplot(1,3,2)
bode(a)
grid on
axis([.01 100 -90 0])
pause(.1)
end



% a=tf([1 0],[1]);
% subplot(1,3,3)
% bode(a)