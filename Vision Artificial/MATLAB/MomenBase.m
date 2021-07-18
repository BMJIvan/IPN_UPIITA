function m=MomenBase(X,Y,f,p,q)
m=sum(sum(((X.^p).*(Y.^q)).*f,2));
end