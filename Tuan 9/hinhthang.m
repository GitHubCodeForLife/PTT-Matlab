function [I_a,rEI] = hinhthang(xx,yy,I_e)
    n = length(xx);
    I_a = 0;
    
    for ii = 2:n
        I_a = I_a + ((xx(ii)-xx(ii-1)) * (yy(ii-1)+yy(ii)))/2;
    end
    rEI = abs((I_e-I_a)/I_e);
end