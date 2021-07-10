clc
clear all
close all

for i=1:24;
ruta=strcat('E:\semestre 5\sistemas neurodifusos\PATRONES LEGO ROSTROS\P',num2str(i),'.jpg');
IMA=imread(ruta);
GRIS=double(rgb2gray(IMA));
FOTOS(:,i)=reshape(GRIS,90000,1);
end

for i=1:12;
ruta=strcat('E:\semestre 5\sistemas neurodifusos\PATRONES LEGO ROSTROS\PP',num2str(i),'.jpg');
IMA=imread(ruta);
GRIS=double(rgb2gray(IMA));
FOTOS(:,i+24)=reshape(GRIS,90000,1);
end

P=FOTOS(:,1:16);
[NE,NP]=size(P);
NN=3;

W=rand(NN,NE);
B=rand(NN,1);
dw=zeros(NN,NE);
T=[0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1
   0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1
   0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0];


for EPOCAS=1:200
dw=zeros(NN,NE);
for k=1:NP
a(:,k)=hardlim(W*P(:,k)-B);
e(:,k)=T(:,k)-a(:,k);
dw=dw+e(:,k)*P(:,k)';
end

W=W+dw;
B=B-sum(e,2);
end


for j=1:36
   
    subplot(6,6,j),imshow(uint8(reshape(FOTOS(:,j),300,300)))
    a=hardlim(W*FOTOS(:,j)-B);
    
    if a(:,1)==[0;0;0] 
    nombre='policia';
    end
    
     if a(:,1)==[1;0;0] 
    nombre='emmet';
     end
    
     if a(:,1)==[0;1;0] 
    nombre='lord business';
     end
    
     if a(:,1)==[1;1;0] 
    nombre='lucy';
     end
     
     if a(:,1)==[0;0;1]
    nombre='constructor';
    end
    
    if a(:,1)==[1;0;1] 
    nombre='H. espacial';
    end
    title(nombre)
    
    if a(:,1)==[0;1;1] 
    nombre='robot';
    
    if a(:,1)==[1;1;1] 
    nombre='batman';
    end
    end
end
