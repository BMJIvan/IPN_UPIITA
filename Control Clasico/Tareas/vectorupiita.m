clc
VECA=[0,.67,1.18,1.58,1.9,2.2,2.45,2.69,2.87,2.97,3.04,3,2.86,2.45,1.77,.74,  
    .14,-.17,-.29,-.30,-.25,-.15,.02,.19,.33,.43,.41,.08,-.25,-.32,-.08,.07,    
    .32,.53,.73,.86,.94,.9,.84,.68,.51,.35,.21,.06,-.09,-.19,-.34,-.45,-.5,-.53,-.52,-.43,-.3,-.04];

a=312
v=320-a;
v/100
e=0:length(VECA)-28;
d=(length(VECA)-28):-1:0;
f=[e,d];
length(VECA)
%length(f)
plot(f,VECA);
