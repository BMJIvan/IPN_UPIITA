function [vec] = int5(q0,qf,v0,vf,a0,af,vt0,vtf,dt)
M=[1,vt0,vt0^2,vt0^3,vt0^4,vt0^5
   0,1,2*vt0,3*vt0^2,4*vt0^3,5*vt0^4
   0,0,2,6*vt0,12*vt0^2,20*vt0^3
   1,vtf,vtf^2,vtf^3,vtf^4,vtf^5
   0,1,2*vtf,3*vtf^2,4*vtf^3,5*vtf^4
   0,0,2,6*vtf,12*vtf^2,20*vtf^3];

b=[q0;v0;a0;qf;vf;af];

a=M\b;

t=vt0:dt:vtf;
L=length(t);
vec=zeros(1,L);

for i=1:L
vec(i)=a(1)+(a(2)*t(i))+(a(3)*t(i)^2)+(a(4)*t(i)^3)+(a(5)*t(i)^4)+(a(6)*t(i)^5);
end
end
