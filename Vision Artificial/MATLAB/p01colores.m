clc
%clear all
close all

a=uint8(zeros(255,255,3));
for i=1:255
    for j=1:255
    a(i,j,1)=i;
    a(i,j,2)=j;
    a(i,j,3)=0;
    end
end

figure,
imshow(uint8(a))

b=uint8(zeros(255,255,3));
for i=1:255
    for j=1:255
    b(i,j,1)=256-j;
    b(i,j,2)=0;
    b(i,j,3)=256-i;
    end
end

figure,
imshow(uint8(b))

c=uint8(zeros(255,255,3));
for i=1:255
    for j=1:255
    c(i,j,1)=256-i;
    c(i,j,2)=j;
    c(i,j,3)=255;
    end
end

figure,
imshow(uint8(c))

d=uint8(zeros(255,255,3));
for i=1:255
    for j=1:255
    d(i,j,1)=0;
    d(i,j,2)=j;
    d(i,j,3)=256-i;
    end
end
figure,
imshow(uint8(d))

e=uint8(zeros(255,255,3));
for i=1:255
    for j=1:255
    e(i,j,1)=j;
    e(i,j,2)=255;
    e(i,j,3)=256-i;
    end
end

figure,
imshow(uint8(e))

f=uint8(zeros(255,255,3));
for i=1:255
    for j=1:255
    f(i,j,1)=255;
    f(i,j,2)=256-j;
    f(i,j,3)=256-i;
    end
end

figure,
imshow(uint8(f))

bl=uint8(255*ones(255,255,3));

figure
cubo=[bl,c,bl,bl;b,d,e,f;bl,a,bl,bl];

imshow(cubo)