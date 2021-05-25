function [S] = Simpson1_3(xx,yy,df)
    n = length(xx)
    S = 0 
    loop = round(n/2-1,0) 
    
%     1/3
    for i = 0:loop-1
        id = 2*i+1
        S = S + 1/6*(xx(id+2)- xx(id))*(yy(id+2) + 4*yy(id+1)+yy(id)) 
    end
    
    % hinh thang
    sodu = n - round(n/3,0)*3
    
    if(sodu==1)
        S = S + xx(n)*yy(n)
    end
    if(sodu==-1)
        S  = S + (xx(n)-xx(n-1))/2*(yy(n-1)+yy(n))
    end
    
    
end