clc
clear all
close all
P=[-3,-1,1,1,2,0,-2,-2;-2,-2,-1,-3,0,1,1,2];
[NE,NP]=size(P);
NN=2;
T=[0,0,1,1,1,1,0,0,;0,0,0,0,1,1,1,1];

W=rand(NN,NE);
B=rand(NN,1);
dw=zeros(NN,NE);

hold on
%while(1)
for EPOCAS=1:10
cla

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
    

x1=-5:.1:5;
x2=(B(1,1)-W(1,1)*x1)/(W(1,2));

x3=-5:.1:5;
x4=(B(2,1)-W(2,1)*x3)/(W(2,2));
    
a(:,i)=hardlim(W*P(:,i)-B);
e(:,i)=T(:,i)-a(:,i);
dw=dw+e(:,i)*P(:,i)'


plot([-100 100],[0 0],'k')
plot([0 0],[-100 100],'k')
plot(x1,x2)
plot(x3,x4)
axis([-5 5 -5 5])


end
%if sum(e)==0
 %   break;
%end
W=W+dw;
B=B-sum(e,2);
pause(.1)
end

