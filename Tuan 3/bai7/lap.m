function [xn] = lap(f, phi, xo, Df)
    syms x
    h = {'STT' 'x' 'f(x)' '|f(x) <= Df|' 'rEc'};
    k = 1; 
    data = [];
    xn = xo;
    while abs(subs(f,x,xn)) > Df 
        data(k,1) = k;
        xn = subs(phi,x,xo);
        data(k,2) = xn;
        rExn = abs((xn-xo)/xo);
        data(k,5) = rExn;
        fx = subs(f,x,xn);
        data(k, 3) = fx;
        if abs(fx) < Df
            data(k, 4) = 1;
            break;
        else 
            data(k, 4) = 0 ;
        end;
        if k > 10
            break;
        end
        k = k + 1;
        xo = xn;
    end
    xn = data(k,2);
    f=figure;
    t=uitable(f,'data',data,'columnname',h);
end
