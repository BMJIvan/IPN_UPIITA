function m=sigmoide(x,a,c)
m=1./(1+exp(-a*(x-c)));
end