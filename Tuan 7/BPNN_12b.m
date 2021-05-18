function [] = BPNN_12a(xx,yy,xc)   
%    Tinh gia tri N, Y, XX, XsinX, XcosX, XY, sinXsinX, ,sinXcosX, YsinX, YcosX
    N = length(xx);
    Y = sum(yy);
    XX = sum(xx.*xx);
    XsinX = sum(xx.*sin(xx));
    XcosX = sum(xx.*cos(xx));
    XY = sum(xx.*yy);
    sinXsinX = sum(sin(xx).*sin(xx));
    sinXcosX = sum(sin(xx).*cos(xx));
    cosXcosX = sum(cos(xx).*sin(xx));
    YsinX = sum(yy.*sin(xx));
    YcosX = sum(yy.*cos(xx));
    
% Giai he tim a va b   
    syms a b c
    [a, b, c] = solve(XX*a + XsinX*b + XcosX*c == XY,... 
                    XsinX*a + sinXsinX*b + sinXcosX*c == YsinX,...
                    XcosX*a + sinXcosX*b + cosXcosX*c == YcosX)
    
% Xay dung da thuc noi suy f(x)
    syms x 
    f = a*x + b*sin(x) + c*cos(x)
    
% Xuat ket qua va ve hinh
    f =matlabFunction(f);
    for i = 1:length(xc)
        fprintf('f(%.2f) = %f\n',xc(i),f(xc(i)))
    end
        ezplot(f, [xx(1) xx(end)])
        hold on
        plot(xx,yy,'v-')
end