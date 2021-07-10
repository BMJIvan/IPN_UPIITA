clc
clear all
close all

P=[
   ];
T=[1,1,1,2,2,2,2,3,3,3];
[NE,NP]=size(P);
W=rand(1,NE);
B=rand;
epsilon=0.00002;
% 

for EPOCAS=1:30000
    cla
for i=1:NP
    PP=P(:,i);
    a(i)=purelin(W*PP-B);
    e(i)=T(i)-a(i);
    W=W+epsilon*e(i)*PP';
    B=B-epsilon*e(i);
end
 %stem(T)
 %stem(a,'r')
 %pause(.1)

end
