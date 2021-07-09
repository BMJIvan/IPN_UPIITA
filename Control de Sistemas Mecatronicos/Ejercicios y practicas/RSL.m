function [polos]=RSL(MP,ts)
polos=zeros(1,2);
MP=MP/100;

fi=sqrt((log(MP)^2)/((pi^2)+(log(MP)^2)));
wn=4/(ts*fi);
polos(1)=-fi*wn+(wn*sqrt((fi^2)-1));
polos(2)=conj(polos(1));

