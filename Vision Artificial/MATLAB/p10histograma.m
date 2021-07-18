clc
close all
% clear all

im=imread('F:\semestre 6\vision artificial/pokemon.bmp');

r=zeros(1,256);
g=zeros(1,256);
b=zeros(1,256);

rr=im(:,:,1);
gg=im(:,:,2);
bb=im(:,:,3);

l=size(rr);

for i=1:l(1);
    for j=1:l(2)
        e=rr(i,j)+1;
        r(e)=r(e)+1;
        e=gg(i,j)+1;
        g(e)=g(e)+1;
        e=bb(i,j)+1;
        b(e)=b(e)+1;
    end
end
vec=1:256;
hold on
plot(vec,r)
plot(vec,g)
plot(vec,b)