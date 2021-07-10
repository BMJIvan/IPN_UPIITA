function m=singleton(x,a)
for i=1:length(x)
    if x(i)==a
        m(i)=1;
    else
        m(i)=0;
    end
end