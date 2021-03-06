clc
%clear all
close all

% A 
% A=[1,-1;0,-1];
% B=[1;1];
% C=[1,2];
% u=1;

% B
% A=[0,1;-4,-5];
% B=[1;2];
% C=[1,-1];
% u=1;

%C
% A=[-3,1;0,-3];
% B=[1;0];
% C=[1,1];
% u=10;

%D
% A=[-4,0;0,-3];
% B=[0;1];
% C=[-1,1];
% u=5;

%E
% A=[0,1;-2,-3];
% B=[1;1];
% C=[1,0];
% u=-10;

%F
% A=[-1,0,0;0,-2,1;0,0,-2];
% B=[1;1;0];
% C=[1,0,-1];
% u=1;

%G
A=[-5,1,0;0,-5,1;0,0,-5];
B=[1;0;1];
C=[1,1,0];
u=1;

vp=eig(A);
fil=size(A,2);

x0=ones(fil,1);

syms s t
det=inv(s*eye(fil)-A);
Pa=ilaplace(det)*x0;
Pb=ilaplace(det*B*(u/s));
xt=Pa+Pb;
yt=C*xt;