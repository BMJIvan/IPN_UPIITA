clc
clear all
close all
p=[1,-1,-1,1;1,1,-1,-1];
[NE NP]=size(p);

for i=1:NP
   p(:,i)=p(:,i)./norm(p(:,i)); 
end
pp=[.5;-.3];
pp=pp./norm(pp);
a=compet(p'*pp)