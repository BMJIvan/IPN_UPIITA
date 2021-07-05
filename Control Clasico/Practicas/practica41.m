close all
clc
clear all
w=[-1,0,.1,.5,1,3,5,10];
t=0:.01:10;
hold on
for i=1:length(w)
    
%G=tf([1],[1 w(i) 1]);
G=tf([w(i)*w(i)],[1 2*w(i) w(i)*w(i)]);
%y=step(t,G);
pzmap(G);
%plot(t,y)
%rlocus(1,[1 2*w(i) 1])

%bode(G);
%axis([0 10 0 5])
end
