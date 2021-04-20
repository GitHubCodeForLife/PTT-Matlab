function [Xn, fX] = lap(A, C, tol )
    [row col] = size(A);
    B = -A./diag(A)+eye(row);
    G = C./diag(A);
    X0 = G;
    k = 1;
    T_XN =0;
    T_FX =0;
    T_Condition =0 ;
    T_REX =0 ;
    while 1
        Xn = B*X0 + G;
        rEx = norm((Xn-X0)./X0);
        fX  = norm(A*Xn - C);
        for i = 1:row
            T_XN(k,i) = Xn(i);
        end
        T_FX(k,1) = fX;
        T_Condition(k,1) = double(fX<tol);
        T_REX(k,1) = rEx;
        if fX <  tol break; end;
        X0 = Xn;
        k = k+1;
    end
    table(T_XN, T_FX, T_Condition, T_REX)
end