clc
close all
clear all

P=[0,0,1,1;0,1,0,1];
[NE,NP]=size(P);

w11=[2 2];
b11=1;
w12=[-2/3 -2/3];
b12=-1;
b1=[b11;b12];
W1=[w11;w12];

for i=1:NP
n1=W1*P(:,i)-b1;
a(:,i)=hardlim(n1);
end
P=a;
[NE,NP]=size(P);
W2=[2/3 2/3];
b2=1;
T=[0,1,1,0];


clc
close all
clear all

P=[0,0,1,1;0,1,0,1];
[NE,NP]=size(P);


w11=[-2 -2];
b11=-1;

x21=-5:.1:5;
x22=(b11-w11(1,1)*x21)/(w11(1,2));
w12=[2/3 2/3];
b12=1;
x211=-5:.1:5;
x221=(b12-W11(1,1)*x21)/(W11(1,2));

b1=[b11;b12];
W1=[w11;w12];

for i=1:NP
n1=W1*P(:,i)-b1;
a1(:,i)=hardlim(n1);
end

[NE,NP]=size(P);
W2=[2 2];
b2=1;

for i=1:NP
n2=W2*a1(:,i)-b2;
a2(i)=hardlim(n2);
end


hold on
T=[1,0,0,1];
x21=-5:.1:5;
x22=(b2-W2(1,1)*x21)/(W2(1,2));


for i=1:NP
    if T(i)==0
        plot([P(1,i)],[P(2,i)],'ro')
    else
         plot([P(1,i)],[P(2,i)],'bo')
    end
end     
plot(x21,x22)
plot(x211,x221)
hold off
axis([-5 5 -5 5])



