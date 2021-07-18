clc
close all

ima=imread('E:\semestre 6\vision artificial/iv.bmp');
imb=imread('E:\semestre 6\vision artificial/sqr.bmp');
imc=imread('E:\semestre 6\vision artificial/bool.bmp');

%gris=rgb2gray(ima);
%figure,imshow(gris)
%figure,mesh(double(gris))

subplot(1,3,1)
mesh(double(ima(:,:,1)))
subplot(1,3,2)
mesh(double(ima(:,:,2)))
subplot(1,3,3)
mesh(double(ima(:,:,3)))


% subplot(3,3,1)
% imshow(ima(:,:,1))
% subplot(3,3,2)
% imshow(ima(:,:,2))
% subplot(3,3,3)
% imshow(ima(:,:,3))
% 
% subplot(3,3,4)
% imshow(imb(:,:,1))
% subplot(3,3,5)
% imshow(imb(:,:,2))
% subplot(3,3,6)
% imshow(imb(:,:,3))
% 
% subplot(3,3,7)
% imshow(imc(:,:,1))
% subplot(3,3,8)
% imshow(imc(:,:,2))
% subplot(3,3,9)
% imshow(imc(:,:,3))