function m=campana(x,a,b,c)
m=1./(1+(abs((x-c)./(a)).^(2*b)));
end