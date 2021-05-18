function [] = BPNN_bac1(xx,yy,xc)   
%    Tinh gia tri N, X, Y, XX, XY
    N = length(xx);
    X = sum(xx);
    Y = sum(yy);
    XX = sum(xx.*xx);
    XY = sum(xx.*yy);
    
% Giai he tim a va b   
    syms a b
    [a, b] = solve(XX*a+X*b == XY, X*a+N*b == Y);
    
% Xay dung da thuc noi suy f(x)
    syms x 
    f = a*x + b
    
% Xuat ket qua va ve hinh
    f =matlabFunction(f);
    for i = 1:length(xc)
        fprintf('f(%.2f) = %f\n',xc(i),f(xc(i)))
    end
        ezplot(f, [xx(1) xx(end)])
        hold on
        plot(xx,yy,'v-')
end