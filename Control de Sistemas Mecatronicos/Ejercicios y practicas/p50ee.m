clc
clear all
close all


m1=2;
m2=1;
m3=1;
v1=1;
v2=1;
v3=1;
v4=1;
v5=1;
k=2;

I=eye(6);

A=[0,1,0,0,0,0;
  -k/m1,(-v2-v4-v1)/m1,k/m1,v2/m1,0,v4/m1
  0,0,0,1,0,0 
  k/m2,v2/m2,-k/m2,(-v2-v5)/m2,0,v5/m2
  0,0,0,0,0,1
  0,v4/m3,0,v5/m3,0,(-v4-v3-v5)/m3
    ];
B=[0;0;0;1/m2;0;0];
C=[0,0,0,1,0,0];

cr2=size(B,1);
Ck=[B A*B A^2*B A^3*B A^4*B A^5*B];
cr0=rank(Ck);
ck=ctrb(A,B);
cr1=rank(ck);
Ok=[C;C*A;C*A^2;C*A^3;C*A^4;C*A^5];
co0=rank(Ok);
co=obsv(A,C);
co1=rank(co);
if(cr2==cr1&&cr1==cr2)
    disp('controlable')
else
    disp('no controlable')
end
if(cr0==co0&&cr0==co1)
    disp('observable')
else
    disp('no observable')
end

A=[0,1,0,0
   -9/50,0,9/50,0
   0,0,0,1
   1,0,-1,-1];
B=[0;1/50;0;0];
C=[1,0,0,0];

cr2=length(B);
Ck=[B A*B A^2*B A^3*B];
cr0=rank(Ck);
ck=ctrb(A,B);
cr1=rank(ck);
Ok=[C;C*A;C*A^2;C*A^3];
co0=rank(Ok);
oo=obsv(A,C);
co1=rank(co);
if(cr2==cr1&&cr1==cr2)
    disp('controlable')
else
    disp('no controlable')
end
if(cr0==co0&&cr0==co1)
    disp('observable')
else
    disp('no observable')
end


A=[-25/18];
B=[5/6];
C=[3/5];

cr2=length(B);
Ck=[B];
cr0=rank(Ck);
ck=ctrb(A,B);
cr1=rank(ck);
Ok=[C;C*A;C*A^2;C*A^3];
co0=rank(Ok);
co=obsv(A,C);
co1=rank(co);
if(cr2==cr1&&cr1==cr2)
    disp('controlable')
else
    disp('no controlable')
end
if(cr0==co0&&cr0==co1)
    disp('observable')
else
    disp('no observable')
end


A=[0,1;-550/1300,-4000/1300];
B=[0;10/1300];
C=[1,0];
cr2=length(B);
Ck=[B A*B];
cr0=rank(Ck);
ck=ctrb(A,B);
cr1=rank(ck);
Ok=[C;C*A;C*A^2;C*A^3];
co0=rank(Ok);
co=obsv(A,C);
co1=rank(co);
if(cr2==cr1&&cr1==cr2)
    disp('controlable')
else
    disp('no controlable')
end
if(cr0==co0&&cr0==co1)
    disp('observable')
else
    disp('no observable')
end