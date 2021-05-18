function [] = BPNN_11b(xx,yy,xc)
   
%    Tinh gia tri N, LX, LXLX, LY, LXLY
    N = length(xx);
    LX = sum(log(xx));
    LXLX = sum(log(xx).*log(xx));
    LY = sum(log(yy));
    LXLY = sum(log(xx).*log(yy));
    
% Giai h? tìm a và b   
    syms a b
    [a, b] = solve(LXLX*a+LX*b == LXLY, LX*a+N*b == LY);
    
% Xay dung da thuc noi suy f(x)
    syms x 
    f = exp(b)*(exp(x)^a)
    
% Xuat ket qua va ve hinh 
    f =matlabFunction(f);
    for i = 1:length(xc)
        fprintf('f(%.2f) = %f\n',xc(i),f(xc(i)))
    end
        ezplot(f, [xx(1) xx(end)])
        hold on
        plot(xx,yy,'v-')
end