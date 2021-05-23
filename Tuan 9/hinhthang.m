function [] = hinhthang(xx,yy,df)
    n = length(xx)
    S = 0 
    for i = 2:n
        S = S + 0.5*(xx(i)- xx(i-1))*(yy(i-1)+yy(i)) ;
    end
    S
end