clc
clear all
close all
P=[-3,-1,1,1,2,0,-2,-2;-2,-2,-1,-3,0,1,1,2];
[NE,NP]=size(P);
T=[0,0,1,1,1,1,0,0,;0,0,0,0,1,1,1,1];



hold on
for i=1:NP
    if T(:,i)==[0;0]
        plot(P(1,i),P(2,i),'bs')
    elseif T(:,i)==[1;0]
        plot(P(1,i),P(2,i),'ro')
    elseif T(:,i)==[1;1]
        plot(P(1,i),P(2,i),'dk')
    else
        plot(P(1,i),P(2,i),'b*')
    end
end
plot([-100 100],[0 0],'k')
plot([0 0],[-100 100],'k')
axis([-5 5 -5 5])