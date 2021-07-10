clc
clear all
close all


dw=[0,0];
for i=1:16;
ruta=strcat('F:\semestre 5\sistemas neurodifusos\LEGO PERCEPTRON\P',num2str(i),'.jpg');
IMA=imread(ruta);
GRIS=double(rgb2gray(IMA));
FOTOS(:,i)=reshape(GRIS,90000,1);
end

P=FOTOS(:,1:4);
[NE,NP]=size(P);

W=rand(1,NE);
b=rand;
T=[1,0,1,0];


while(1)
    dw=zeros(1,NE);
for k=1:NP
    a(k)=hardlim(W*P(:,k)-b);
    e(k)=T(k)-a(k);
    dw=dw+e(k)*P(:,k)';
end
W=W+dw;
b=b-sum(e);
if sum(e)==0
    break;
end
end

for j=1:16
   
    subplot(4,4,j),imshow(uint8(reshape(FOTOS(:,j),300,300)))
    a=hardlim(W*FOTOS(:,j)-b);
    title(num2str(a))
end

%figure,mesh(reshape(W,300,300))