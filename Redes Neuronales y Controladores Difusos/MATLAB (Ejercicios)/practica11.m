clc
clear all
close all

E=-360:360;
V=-100:100;

mi1=trapezoidal(E,-360,-360,-300,-200);
mi2=triangular(E,-300,-200,-100);
mi3=triangular(E,-200,-100,0);
mi4=triangular(E,-10,0,10);
mi5=triangular(E,0,100,200);
mi6=triangular(E,100,200,300);
mi7=trapezoidal(E,200,300,360,360);

%entrada=-5;
n=1;
hold on
for entrada=-360:360
    cla
for i=1:length(E)
   if E(i)==entrada
   M=[mi1(i) mi2(i) mi3(i) mi4(i) mi5(i) mi6(i) mi7(i)];
   end
end
X=M;

f1=X(1)-100;
f2=X(2)-66.6;
f3=X(3)-33.3;
f4=X(4)+0;
f5=X(5)+33.3;
f6=X(6)+66.6;
f7=X(7)+100;

plot(E,mi1*f1);
plot(E,mi2*f2);
plot(E,mi3*f3);
plot(E,mi4*f4);
plot(E,mi5*f5);
plot(E,mi6*f6);
plot(E,mi7*f7);
fm=[ f1 f2 f3 f4 f5 f6 f7].*M;
stem([entrada],fm(1));
stem([entrada],fm(2));
stem([entrada],fm(3));
stem([entrada],fm(4));
stem([entrada],fm(5));
stem([entrada],fm(6));
stem([entrada],fm(7));


% figure,
% hold on
% plot(V,f1*ones(1,length(V)))
% plot(V,f2*ones(1,length(V)))
% plot(V,f3*ones(1,length(V)))
% plot(V,f4*ones(1,length(V)))
% plot(V,f5*ones(1,length(V)))
% plot(V,f6*ones(1,length(V)))
% plot(V,f7*ones(1,length(V)))

DIFUSA=[f1,f2,f3,f4,f5,f6,f7];
Z=sum((M.*DIFUSA)/(sum(M)));
input(n)=entrada;
S(n)=Z;
plot(input,S,'k')
pause(.1)

n=n+1;
end

figure,plot(input,S,'k')