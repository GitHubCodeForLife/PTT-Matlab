function [] = BPNN_12a(xx,yy,xc)   
%    Tinh gia tri N, X, Y, XX, XXX, XXXX, XXY, XY
    N = length(xx);
    X = sum(xx);
    Y = sum(yy);
    XX = sum(xx.*xx);
    XXX = sum(xx.*xx.*xx);
    XXXX = sum(xx.*xx.*xx.*xx);
    XXY = sum(xx.*xx.*yy);
    XY = sum(xx.*yy);
    
% Giai he tim a va b   
    syms a b c
    [a, b, c] = solve(XXXX*a + XXX*b + XX*c == XXY,... 
                    XXX*a + XX*b + X*c == XY,...
                    XX*a + X*b + N*c == Y)
    
% Xay dung da thuc noi suy f(x)
    syms x 
    f = a*(x^2) + b*x + c
    
% Xuat ket qua va ve hinh
    f =matlabFunction(f);
    for i = 1:length(xc)
        fprintf('f(%.2f) = %f\n',xc(i),f(xc(i)))
    end
        ezplot(f, [xx(1) xx(end)])
        hold on
        plot(xx,yy,'v-')
end