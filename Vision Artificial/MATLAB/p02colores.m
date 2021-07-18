clc
close all

ii=500;
jj=500;
c=3;
ima=zeros(ii,jj,c);
%ima=zeros(ii,jj);
for f=0:.01:1
for i=1:ii
    for j=1:jj
%    ima(i,j,1)=64;
%    ima(i,j,2)=64;
%    ima(i,j,3)=253;
%ima(i,j)=(127*sin(100*j))+127;
ima(i,j,1)=((127*(sin(f*i)+sin(f*j)))+127)/2;
ima(i,j,2)=((80*(sin(f*i)+sin(f*j)))+127)/2;
ima(i,j,3)=((127*(sin(f*2*i)+sin(f*2*j)))+127)/2;
    end
end

imshow(uint8(ima))
drawnow
end
% figure
% mesh(ima)