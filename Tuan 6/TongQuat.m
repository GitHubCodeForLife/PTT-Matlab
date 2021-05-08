function [] = TongQuat(xx,yy,xc)
    [~, n] = size(xx);
    X = zeros(n,n);
    Y = zeros(n,1);
    for i = 1:n
        X(i,1) = 1;
        Y(i,1) = yy(1,i);
        for j  = 2:n
            X(i,j) = xx(1,i)^(j-1);
        end
    end
    % Giar phuong trinh XA = Y
    A = inv(X)*Y;
    %Xay dung da thuc 
    syms x
    f = A(1);
    for i = 2:n
        f = f + A(i)*x^(i-1);
    end

    f =matlabFunction(f);
    f 
    f(xc)
    ezplot(f, [xx(1) xx(end)])
    hold on
    plot(xx,yy,'v-')
end