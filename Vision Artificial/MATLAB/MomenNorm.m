function n=MomenNorm(upq,u00,p,q)
Ga=((p+q)/2)+1;
if Ga>=2
    n=upq/(u00^Ga);
else
    n=upq/u00;
end
end