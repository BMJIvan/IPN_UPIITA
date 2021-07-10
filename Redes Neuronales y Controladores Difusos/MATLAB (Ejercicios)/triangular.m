
function u=triangular(x,a,b,c)




for i=1:length(x) 
    if x(i)<=a
        u(i)=0;
    elseif x(i)>a&x(i)<=b
            u(i)=(x(i)-a)/(b-a);
    
    elseif x(i)>b&x(i)<=c
                    u(i)=(c-x(i))/(c-b);
                else
                    u(i)=0;
                end
            end
                
                plot(x,u)


end

