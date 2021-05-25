function [I_a,rEI] = simpson13(xx,yy,I_e)
    n = length(xx);
    I_a = 0;
    ii = 1;
    
    while ii < n
        I_a = I_a + ((xx(ii+2)-xx(ii)) * (yy(ii)+4*yy(ii+1)+yy(ii+2)))/6;
        ii = ii + 2;
    end
    rEI = abs((I_e-I_a)/I_e);
end