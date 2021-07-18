clc
clear all
close all

Lx=500;
Ly=500;
ima=zeros(500,500);

for w=0:.1:100
for i=1:Lx
    for j=1:Ly
       % ima(i,j)=127*sin(w*j)+127;
       ima(i,j)=((((sin(w*i)+sin(w*j))/2)*127)+127)*((-1)^(i+j));
    end
end

%imshow(uint8(ima))
TF=fft2(ima);
mesh(abs(TF))
drawnow
end