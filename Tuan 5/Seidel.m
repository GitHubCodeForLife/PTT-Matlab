function [Xn, fX] = Seidel(A, C, tol )
    [row col] = size(A);
    B = -A./diag(A)+eye(row);
    G = C./diag(A);
    X0 = G;
    k = 1;
    Xn = X0;
    T_XN =0;
    T_FX =0;
    T_Condition =0 ;
    T_REX =0 ;
    while 1
       for i = 1:row
           Xn(i) = 0;
           for j = 1:i-1
               Xn(i) =Xn(i)+ B(i,j)*Xn(j);
           end
           for j = i:col
              Xn(i) = Xn(i) + B(i,j)*X0(j);
           end
           Xn(i) = Xn(i) + G(i);
       end
       rEx = norm((Xn-X0)./X0);
       fX = norm(A*Xn - C);
       for i = 1:row
            T_XN(k,i) = Xn(i);
       end
       T_FX(k,1) = fX;
       T_Condition(k,1) = double(fX<tol);
       T_REX(k,1) = rEx;
       if fX <  tol break; end;
        X0 = Xn;
        k = k+1;
       if k > 10 break; end;
    end
    T = table(T_XN, T_FX, T_Condition, T_REX)
    T.Properties.VariableNames = {'Xn' 'Fx' 'Condition' 'REX'}
end
