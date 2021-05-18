function [] = BPNN_11a(xx,yy,xc)   
%    Tinh gia tri N, X, Y, XX, XXX, XXY
    N = length(xx);
    X = sum(xx);
    Y = sum(yy);
    XX = sum(xx.*xx);
    XXX = sum(xx.*xx.*xx);
    XXY = sum(xx.*xx.*yy);
    
% Giai he tim a va b   
    syms a b
    [a, b] = solve(XXX*a+XX*b == XXY, X*a+N*b == Y)
    
% Xay dung da thuc noi suy f(x)
    syms x 
    f = a*(x^2) + b
    
% Xuat ket qua va ve hinh
    f =matlabFunction(f);
    for i = 1:length(xc)
        fprintf('f(%.2f) = %f\n',xc(i),f(xc(i)))
    end
        ezplot(f, [xx(1) xx(end)])
        hold on
        plot(xx,yy,'v-')
end