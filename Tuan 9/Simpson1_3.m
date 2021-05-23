function [S] = Simpson1_3(xx,yy,df)
    n = length(xx)
    S = 0 
    loop = round(n/3,0) 
    for i = 0:loop-1
        id = 2*i+1
        S = S + 1/6*(xx(id+2)- xx(id))*(yy(id+2) + 4*yy(id+1)+yy(id)) 
    end
    if(loop*3 ==n)
        return;
    end
    if(n-loop*3 == 1)
        n
        S = S + xx(end)
    end
     if(n-loop*3 == 2)
        S = S +  0.5*(xx(n)- xx(n-1))*(yy(n-1)+yy(n)) ;
    end
end