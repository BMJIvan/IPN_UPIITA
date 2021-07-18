function M=MomenInv(f)
    [filas,columnas]=size(f);
    [Y,X]=meshgrid(1:filas,1:columnas);

    m00=MB(X,Y,f,0,0);
    m10=MB(X,Y,f,1,0);
    m01=MB(X,Y,f,0,1);

    xs=m10/m00;
    ys=m01/m00;

    u00=MC(X,Y,f,0,0,xs,ys);
    u20=MC(X,Y,f,2,0,xs,ys);
    u02=MC(X,Y,f,0,2,xs,ys);
    u11=MC(X,Y,f,1,1,xs,ys);
    u30=MC(X,Y,f,3,0,xs,ys);
    u03=MC(X,Y,f,0,3,xs,ys);
    u12=MC(X,Y,f,1,2,xs,ys);
    u21=MC(X,Y,f,2,1,xs,ys);

    n20=MN(u20,u00,2,0);
    n02=MN(u02,u00,0,2);
    n11=MN(u11,u00,1,1);
    n30=MN(u30,u00,3,0);
    n03=MN(u03,u00,0,3);
    n12=MN(u12,u00,1,2);
    n21=MN(u21,u00,2,1);

    MI1=n20+n02;
    MI2=((n20-n02)^2)+(4*(n11^2));
    MI3=((n30+(3*n12))^2)+(((3*n21)-n03)^2);
    MI4=((n30+n12)^2)+(n21+n03)^2;
    MI5=((n30-(3*n12))*(n30+n12)*(((n30+n12)^2)-(3*((n21+n03)^2))))...
    +(((3*n21)-n03)*(n21+n03)*((3*((n30+n12)^2))-((n21+n03)^2)));
    MI6=((n20-n02)*(((n30+n12)^2)-((n21+n03)^2)))+(4*n11*(n30+n12)*(n21+n03));
    MI7=(((3*n21)-n30)*(n30+n12)*(((n30+n12)^2)-(3*(n21+n03)^2)))...
    +(((3*n12)-n30)*(n21+n03)*((3*(n30+n12)^2)-((n21+n03)^2)));
M=[MI1,MI2,MI3,MI4,MI5,MI6,MI7];
end

function m=MB(X,Y,f,p,q)
m=sum(sum(((X.^p).*(Y.^q)).*f,2));
end

function u=MC(X,Y,f,p,q,xs,ys)
u=sum(sum((((X-xs).^p).*((Y-ys).^q)).*f,2));
end

function n=MN(upq,u00,p,q)
Ga=((p+q)/2)+1;
if Ga>=2
    n=upq/(u00^Ga);
else
    n=upq/u00;
end
end