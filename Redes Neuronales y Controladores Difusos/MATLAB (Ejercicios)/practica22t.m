clc
close all
clear all

P11=[0,0,1,1,.5;0,1,0,1,.5];
%P11=[.5;.5];
[NE0,NP0]=size(P11);

w11=[2 2];
%w11=[1.2 1.2];
b11=1;
xa1=-2:.1:2;
xb1=(b11-w11(1,1)*xa1)/(w11(1,2));


w12=[-.6666 -.6666];
%w12=[-.8 -.8];
b12=-1;
xa2=-2:.1:2;
xb2=(b12-w12(1,1)*xa2)/(w12(1,2));

w13=[2 -2];
%w13=[3.5 -3.5];
b13=-1;
xa3=-2:.1:2;
xb3=(b13-w13(1,1)*xa3)/(w13(1,2));

w14=[-2 2];
%w14=[-3.5 3.5];
b14=-1;
xa4=-2:.1:2;
xb4=(b14-w14(1,1)*xa4)/(w14(1,2));



for i=1:NP0
a1(:,i)=hardlim(w11*P11(:,i)-b11);
a2(:,i)=hardlim(w12*P11(:,i)-b12);
a3(:,i)=hardlim(w13*P11(:,i)-b13);
a4(:,i)=hardlim(w14*P11(:,i)-b14);
end


P21=[a1;a2];
P22=[a3;a4];

w21=[2/3 2/3];
b21=1;
xa5=-2:.1:2;
xb5=(b21-w21(1,1)*xa5)/(w21(1,2));

w22=[2/3 2/3];
b22=1;
xa6=-2:.1:2;
xb6=(b22-w22(1,1)*xa6)/(w22(1,2));


for i=1:NP0
a5(:,i)=hardlim(w21*P21(:,i)-b21);
a6(:,i)=hardlim(w22*P22(:,i)-b22);
end

P31=[a5;a6];

w31=[2/3 2/3];
b31=1;
xa7=-2:.1:2;
xb7=(b31-w31(1,1)*xa7)/(w31(1,2));

for i=1:NP0
a7(:,i)=hardlim(w31*P31(:,i)-b31);
end

a7
T=[0,0,0,0,1]; 
hold on
for i=1:NP0
    if T(i)==0
        plot([P11(1,i)],[P11(2,i)],'ro')
    else
         plot([P11(1,i)],[P11(2,i)],'bo')
    end
end     


plot(xa1,xb1)
plot(xa2,xb2)
plot(xa3,xb3)
plot(xa4,xb4)
hold off


