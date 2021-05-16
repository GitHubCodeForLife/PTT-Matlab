function [] = Spline(xx,yy,xc,pos)
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
    S = zeros(1, n-1);
    for ii = 1:n-1
        n
        S(ii) = m(ii+1) * (x-xx(ii))^3/(6*h(ii))...
            + m(ii) * (xx(ii+1-x))^3/(6*h(ii))...
            + M(ii) * (xx(ii+1)-x)/h(ii)...
            + N(ii) * (x-xx(ii))/h(ii);
        S(ii) = matlabFunction(S(ii));
    end

    % Xap xi gia tri y(i)
    for i = 1:length(xc)
        temp = S(pos(i));
        temp(xc(ii))
    end
    
    % Ve cac diem trong bang du lieu va ham spline
    hold on
    plot(xx,yy,'v-')
    
    for i = 1:n-1
        ezplot(S(i),[xx(i) xx(i+1)])
    end
end
