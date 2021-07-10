function u=trapezoidal(x,a,b,c,d)



for i=1:length(x) 
    if x(i)<=a
        u(i)=0;
    elseif x(i)>a&x(i)<=b
            u(i)=(x(i)-a)/(b-a);
    elseif x(i)>b&x(i)<=c
                u(i)=1;
    elseif x(i)>c&x(i)<=d
                    u(i)=(d-x(i))/(d-c);
                else
                    u(i)=0;
                end
            end
                
                plot(x,u)

end

