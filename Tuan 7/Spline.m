function [] = Spline(xx,yy,xc)
    h = xx(2:end) - xx(1:end-1);
    n = length(xx);
    n = n - 1;
    A = zeros(n-1);
    b = zeros(n-1,1);
    
    for ii = 1:(n-1)
        if ii == 1
            A(ii, ii) = (h(ii) + h(ii+1))/3;
            A(ii, ii+1) = h(ii+1)/6;
            b(ii) = (yy(ii+2) - yy(ii+1))/h(ii+1) - (yy(ii+1) - yy(ii))/h(ii);
        elseif ii == n-1
            A(ii, ii-1) = h(ii)/6;
            A(ii, ii) = (h(ii) + h(ii+1))/3;
            b(ii) = (yy(ii+2) - yy(ii+1))/h(ii+1) - (yy(ii+1) - yy(ii))/h(ii);
        else
            A(ii, ii-1) = h(ii)/6;
            A(ii, ii) = (h(ii) + h(ii+1))/3;
            A(ii, ii+1) = h(ii+1)/6;
            b(ii) = (yy(ii+2) - yy(ii+1))/h(ii+1) - (yy(ii+1) - yy(ii))/h(ii);
        end
    end
    A
    
    syms x
    m = [0, (A\b)', 0];
    S = x*ones(n,1);
    for ii = 1:n
        M = yy(ii) - m(ii)*h(ii)^2/6;
        N = yy(ii+1) - m(ii+1)*h(ii)^2/6;
        S(ii) = m(ii+1)*((x-xx(ii))^3)/(6*h(ii)) + m(ii)*((x-xx(ii+1))^3)/(6*h(ii))...
            + M*(xx(ii+1)-x)/h(ii) + N*(x-xx(ii))/h(ii);
    end
    
    figure
    hold on
    grid on
    for ii = 1:length(xc)
        k = 1;
        while (k<=n)
            if (xc(ii) >= xx(k) && xc(ii) <= xx(k+1))
                break;
            end
            k = k + 1;
        end
        yc = subs(S(k), x, xc(ii));
        fprintf('Gia tri noi suy tai x = %.4f la: %.8f.\n', xc(ii), yc);
        plot(xc(ii), yc, 'ro');
    end
    
    for ii = 1:n
        h = fplot(S(ii),[xx(ii) xx(ii+1)], 'b', 'Linewidth',1);
    end
    k = plot(xx,yy, 'm*-', 'Linewidth',0.5);
    legend([h,k],'Da thuc xap xi.','Gia tri chinh xac.');
end