clc
clear all
close all

P=[0,0,1,1;0,1,0,1];
T=[0,1,1,1];
[NE,NP]=size(P);

%W=[0,0];
W=rand(1,NE);
b=rand;
dw=[0,0];


hold on
while(1)
    cla
for i=1:NP

a(i)=hardlim(W*P(:,i)-b);
e(i)=T(i)-a(i);
dw=dw+e(i)*P(:,i)'; 
if T(i)==0
        plot([P(1,i)],[P(2,i)],'ro')
    else
         plot([P(1,i)],[P(2,i)],'bo')
end
W=W+dw;
b=b-sum(e);


end

x1=-5:.1:5;
x2=(b-W(1,1)*x1)/(W(1,2));
plot(x1,x2)
axis([-2 2 -2 2])
pause(.125)
if sum(e)==0
    break;
end
end
hold off