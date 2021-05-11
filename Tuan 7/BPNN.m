function [] = BPNN(xx,yy,xc)
   
%    Tinh giá trị N, X, Y, XX, XY
    N = length(xx)
    X = sum(xx)
    Y = sum(yy)
    XX = sum(xx.*xx)
    XY = sum(xx.*yy)
% Giai hệ tìm a và b   
    syms a b
    [a, b] = solve(XX*a+X*b == XY, X*a+N*b == Y)
% Xây dụng đa thức nội suy f(x)
    syms x 
    f = a*x + b
% Xuat ket qua va ve hinh
   
    f =matlabFunction(f);
    display(f)
    for i = 1:length(xc)
        fprintf('f(%.2f) = %f\n',xc(i),f(xc(i)))
    end
        ezplot(f, [xx(1) xx(end)])
        hold on
        plot(xx,yy,'v-')
        plot(xc, f(xc),"go")
end

function [] = BPNN_1(xx,yy,xc)
   
%    Tinh giá trị N, X, LY, XX, XLY
    N = length(xx);
    X = sum(xx)
    LY = sum(log(yy))
    XX = sum(xx.*xx)
    XLY = sum(xx.*log(yy))
% Giai hệ tìm a và b   
    syms a b
    [a, b] = solve(XX*a+X*b == XLY, X*a+N*b == LY);
% Xây dụng đa thức nội suy f(x)
    syms x 
    f = exp(b)*exp(a*x)
% Xuat ket qua va ve hinh
   
    f =matlabFunction(f);
    display(f)
    for i = 1:length(xc)
        fprintf('f(%.2f) = %f\n',xc(i),f(xc(i)))
    end
        ezplot(f, [xx(1) xx(end)])
        hold on
        plot(xx,yy,'v-')
        plot(xc, f(xc),"go")
end