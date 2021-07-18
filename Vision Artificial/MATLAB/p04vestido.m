clc
close all
% clear all

im=imread('F:\semestre 6\vision artificial/vestido.jpg');

imshow(im)
imshow(im(1:140,50:150,:))
imn=im(1:70,50:70,:);
ima=im(71:140,50:70,:);

pr1=zeros(1,3);
pr1(1)=mean(mean(imn(:,:,1)));
pr1(2)=mean(mean(imn(:,:,2)));
pr1(3)=mean(mean(imn(:,:,3)));

color1=zeros(100,100,3);
color1(:,:,1)=pr1(1);
color1(:,:,2)=pr1(2);
color1(:,:,3)=pr1(3);
figure
imshow(uint8(color1))

pr2=zeros(1,3);
pr2(1)=mean(mean(ima(:,:,1)));
pr2(2)=mean(mean(ima(:,:,2)));
pr2(3)=mean(mean(ima(:,:,3)));

color2=zeros(100,100,3);
color2(:,:,1)=pr2(1);
color2(:,:,2)=pr2(2);
color2(:,:,3)=pr2(3);
figure
imshow(uint8(color2))


% fondo=zeros(400,400);
% vec=linspace(1,255,600);
% for i=1:length(vec)
%     for j=1:length(vec)
%         fondo(i,j)=vec(j);
%     end
% end
% close all
% hold on
% imshow(uint8(fondo))
% imshow(uint8(im))
pr1
pr2