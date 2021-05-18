function [] = BPNN_logarit(xx,yy,xc)
   
%    Tinh gia tri N, X, LY, XX, XLY
    N = length(xx);
    X = sum(xx);
    LY = sum(log(yy));
    XX = sum(xx.*xx);
    XLY = sum(xx.*log(yy));
    
% Giai h? tìm a và b   
    syms a b
    [a, b] = solve(XX*a+X*b == XLY, X*a+N*b == LY);
    
% Xay dung da thuc noi suy f(x)
    syms x 
    f = exp(b)*exp(a*x)
    
% Xuat ket qua va ve hinh 
    f =matlabFunction(f);
    for i = 1:length(xc)
        fprintf('f(%.2f) = %f\n',xc(i),f(xc(i)))
    end
        ezplot(f, [xx(1) xx(end)])
        hold on
        plot(xx,yy,'v-')
end