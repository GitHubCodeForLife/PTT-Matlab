function [] = Newton(xx,yy,xc)
%  Xay dung ty sai phan
    n = length(xx);
    TSP = zeros(n,n);
    
    %cot 1
    for ii = 1:n
        TSP(ii,1) = yy(ii);
    end

    %cot 2 --> n
    for ii = 2:n
        len = n - ii + 1;
        for jj = 1 : len
           TSP(jj,ii) = (TSP(jj+1,ii-1)-TSP(jj,ii-1))/(xx(jj+ii-1)-xx(jj));
        end
    end
    
% Xay dung da thuc noi suy
    A = TSP(1,1:n);
    syms x
    f = 0 ;
    for ii = 0:n-1
        temp = 1;
        for jj = 1 :ii
            temp = temp*(x-xx(jj));
        end
        f = f + A(ii+1)*temp ;
    end
    f = simplify(f)
   
% Xuat ket qua va ve hinh
   
    f =matlabFunction(f);
    f 
    for i = 1:length(xc)
        fprintf('f(%.2f) = %f\n',xc(i),f(xc(i)))
    end
        ezplot(f, [xx(1) xx(end)])
        hold on
        plot(xx,yy,'v-')
end