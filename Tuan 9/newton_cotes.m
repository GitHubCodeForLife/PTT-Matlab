function [] = newton_cotes(xx,yy,I_e)
    n = length(xx);
    fprintf('He so H(i,n):\n');
    tinhhs_Hkn(n);
    
    fprintf('\nTich phan hinh thang:\n');
    [I_a,rEI] = hinhthang(xx,yy,I_e);
    fprintf('I_a = %.8f \t rEI = %.8f\n', I_a,rEI);
    
    fprintf('\nTich phan Simpson 3/8:\n');
    [I_a,rEI] = simpson38(xx,yy,I_e);
    fprintf('I_a = %.8f \t rEI = %.8f\n', I_a,rEI);
end