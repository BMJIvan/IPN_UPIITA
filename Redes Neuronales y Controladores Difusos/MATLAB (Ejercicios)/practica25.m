clc
close all
clear all

P=[1,2;1,5];
T=[3 -7];
[NE,NP]=size(P);
NN=1;

W=rand(NN,NE);
B=rand;
epsilon=0.05;

hold on
for epocas=1:100;
for i=1:NP
cla
a(i)=purelin(W*P(:,i)-B);
e(i)=T(i)-a(i);
W=W+epsilon*e(i)*P(:,i)';
B=B-epsilon*e(i);

x1=-10:.1:10;
x2=(B-W(1,1)*x1)/(W(1,2));
plot(x1,x2)
plot(P(1,:),P(2,:),'or')
axis([-10 10 -10 10])
drawnow
pause(.001)
end
title(num2str(epocas))

end
