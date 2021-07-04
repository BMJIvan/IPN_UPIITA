function [vq,vdq,vddq] = interpolar5(vt0,vtf,dt,q0,v0,a0,qf,vf,af)
syms t t0 tf



tt0=[1,t0,t0^2,t0^3,t0^4,t0^5];

ttf=[1,tf,tf^2,tf^3,tf^4,tf^5];

M=sym(zeros(6,6));
M(1,:)=tt0;
M(2,:)=diff(tt0);
M(3,:)=diff(M(2,:));
M(4,:)=ttf;
M(5,:)=diff(ttf);
M(6,:)=diff(M(5,:));
Mf=subs(M,{t0,tf},{vt0,vtf});
b=[q0;v0;a0;qf;vf;af];

a=Mf\b;

t=vt0:dt:vtf;

q=tt0*a;
vq=subs(q,t0,t);
figure,plot(t,subs(q,t0,t),'+')
dq=diff(q);
vdq=subs(dq,t0,t);
figure,plot(t,subs(dq,t0,t),'+')
ddq=diff(dq);
vddq=subs(ddq,t0,t);
figure,plot(t,subs(ddq,t0,t),'+')
end

