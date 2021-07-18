clc
clear all
close all
mi=zeros(7,25);
for N=1:25;

ruta=strcat('C:\Users\xmax1946\Desktop\Modelos\',num2str(N),'.bmp');
ima=imread(ruta);
gris=double(rgb2gray(ima));
[filas,columnas]=size(gris);
f=zeros(filas,columnas);
for i=1:filas
    for j=1:columnas
        if gris(i,j)>=240
            f(i,j)=0;
        else
            f(i,j)=1;
        end
    end
end
[Y,X]=meshgrid(1:filas,1:columnas);

m00=MomenBase(X,Y,f,0,0);
m10=MomenBase(X,Y,f,1,0);
m01=MomenBase(X,Y,f,0,1);

xs=m10/m00;
ys=m01/m00;

u00=MomenCentral(X,Y,f,0,0,xs,ys);
u20=MomenCentral(X,Y,f,2,0,xs,ys);
u02=MomenCentral(X,Y,f,0,2,xs,ys);
u11=MomenCentral(X,Y,f,1,1,xs,ys);
u30=MomenCentral(X,Y,f,3,0,xs,ys);
u03=MomenCentral(X,Y,f,0,3,xs,ys);
u12=MomenCentral(X,Y,f,1,2,xs,ys);
u21=MomenCentral(X,Y,f,2,1,xs,ys);

n20=MomenNorm(u20,u00,2,0);
n02=MomenNorm(u02,u00,0,2);
n11=MomenNorm(u11,u00,1,1);
n30=MomenNorm(u30,u00,3,0);
n03=MomenNorm(u03,u00,0,3);
n12=MomenNorm(u12,u00,1,2);
n21=MomenNorm(u21,u00,2,1);

MI1=n20+n02;
mi(1,N)=MI1;

MI2=((n20-n02)^2)+(4*(n11^2));
mi(2,N)=MI2;

MI3=((n30+(3*n12))^2)+(((3*n21)-n03)^2);
mi(3,N)=MI3;

MI4=((n30+n12)^2)+(n21+n03)^2;
mi(4,N)=MI4;

MI5=((n30-(3*n12))*(n30+n12)*(((n30+n12)^2)-(3*((n21+n03)^2))))...
    +(((3*n21)-n03)*(n21+n03)*((3*((n30+n12)^2))-((n21+n03)^2)));
mi(5,N)=MI5;

MI6=((n20-n02)*(((n30+n12)^2)-((n21+n03)^2)))+(4*n11*(n30+n12)*(n21+n03));
mi(6,N)=MI6;

MI7=(((3*n21)-n30)*(n30+n12)*(((n30+n12)^2)-(3*(n21+n03)^2)))...
    +(((3*n12)-n30)*(n21+n03)*((3*(n30+n12)^2)-((n21+n03)^2)));
mi(7,N)=MI7;

end

for i=1:7
    B=[mi(i,1),mi(i,6),mi(i,11),mi(i,16),mi(i,21)];
    C=[mi(i,2),mi(i,7),mi(i,12),mi(i,17),mi(i,22)];
    S=[mi(i,3),mi(i,8),mi(i,13),mi(i,18),mi(i,23)];
    N=[mi(i,4),mi(i,9),mi(i,14),mi(i,19),mi(i,24)];
    T=[mi(i,5),mi(i,10),mi(i,15),mi(i,20),mi(i,25)];
    subplot(2,4,i)
    hold on
    plot(B,'g')
    plot(C,'b')
    plot(S,'r')
    plot(N,'c')
    plot(T,'m')
end

mit=mi';
nor=min(mit);
for i=1:7
   mi(i,:)=mi(i,:)./nor(i); 
end
for i=1:25
    mi(:,i)=mi(:,i)./norm(mi(:,i));
end
P=mi;

