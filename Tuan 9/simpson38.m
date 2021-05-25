function [I_a,rEI] = simpson38(xx,yy,I_e)
    n = length(xx);
    I_a = 0;
    ii = 1;
    
    while ii < n
        I_a = I_a + ((xx(ii+3)-xx(ii)) * (yy(ii)+3*yy(ii+1)+3*yy(ii+2)+yy(ii+3)))/8;
        ii = ii + 3;
    end
    rEI = abs((I_e-I_a)/I_e);
end