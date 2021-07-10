clc
clear all
close all

P=[1,-1,-1,1;1,1,-1,-1];
[NE NP]=size(P);
W1=P';
B=NE*ones(NP,1);
Pp=[0;1.01];
a=purelin(W1*Pp+B);

epsilon=.5*((1)/(NP-1));
W2=eye(NP)-epsilon*((ones(NP,NP)-eye(NP)));

for n=1:10;
a=poslin(W2*a)
end