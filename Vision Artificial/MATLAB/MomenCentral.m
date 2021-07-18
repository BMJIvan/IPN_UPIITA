function u=MomenCentral(X,Y,f,p,q,xs,ys)
u=sum(sum((((X-xs).^p).*((Y-ys).^q)).*f,2));
end