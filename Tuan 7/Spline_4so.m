function [] = Spline_4so(xx,yy,xc)
    n = length(xx);
    h = xx(2:end) - xx(1:end-1);
    VT = zeros(n,n);
    VP = zeros(n,1);
    
    % Giai hpt tim gia tri m(i)
    % Dong 1
    VT(1,:) = [1,0,0,0];
    VP(1) = 0;
    
    % Dong 2 -> n-1
    for ii = 2:n-1
        VT(ii,ii-1) = h(ii-1)/6;
        VT(ii,ii)   = (h(ii-1)+h(ii))/3;
        VT(ii,ii+1) = h(ii)/6;
        VP(ii)      = (yy(ii+1)-yy(ii))/h(ii) - (yy(ii)-yy(ii-1))/h(ii-1);
    end
    
    % Dong n
    VT(n,:) = [0,0,0,1];
    VP(n) = 0;
    
    m = inv(VT)*(VP);
    
    % Tim gia tri M(i) va N(i)
    M=yy(1:end-1)-m(1:end-1).*h(1:end).^2/6;
    N=yy(2:end)-m(2:end).*h(1:end).^2/6;
    
    % Xay dung da thuc noi suy S(i)
    syms x
    S1 = m(2) * (x-xx(1))^3/(6*h(1))...
            + m(1) * (xx(2)-x)^3/(6*h(1))...
            + M(1) * (xx(2)-x)/h(1)...
            + N(1) * (x-xx(1))/h(1);
    S2 = m(3) * (x-xx(2))^3/(6*h(2))...
            + m(2) * (xx(3)-x)^3/(6*h(2))...
            + M(2) * (xx(3)-x)/h(2)...
            + N(2) * (x-xx(2))/h(2);
    S3 = m(4) * (x-xx(3))^3/(6*h(3))...
            + m(3) * (xx(4)-x)^3/(6*h(3))...
            + M(3) * (xx(4)-x)/h(3)...
            + N(3) * (x-xx(3))/h(3);
    
    S1 = matlabFunction(S1);
    S2 = matlabFunction(S2);
    S3 = matlabFunction(S3);

    fprintf('f(%.2f) = %f\n',xc(1),S1(xc(1)))
    fprintf('f(%.2f) = %f\n',xc(2),S3(xc(2)))
    
    % Ve cac diem trong bang du lieu va ham spline
    hold on
    plot(xx,yy,'v-')
    
    ezplot(S1,[xx(1) xx(2)])
    ezplot(S2,[xx(2) xx(3)])
    ezplot(S3,[xx(3) xx(4)])
end
