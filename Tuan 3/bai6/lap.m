function [xn] = lap(f, phi, xo, Df)
    h = {'STT' 'x' 'f(x)' '|f(x) <= Df|' 'rEc'}
    k = 1; 
    data = []
    xn = xo

    while abs(f(xn)) > Df 
        data(k,1) = k;
        data(k,2) = xn;
        xn = phi(xo);
        rExn = abs((xn-xo)/xo);
        data(k,5) = rExn;
        fx = f(xn);
        data(k, 3) = fx;
        if abs(f(xn)) < Df
            data(k, 4) = 1
        else 
            data(k, 4) = 0 
        end;
        k = k + 1;
        xo = xn;
    end
    data
    f=figure;
    t=uitable(f,'data',data,'columnname',h)
end