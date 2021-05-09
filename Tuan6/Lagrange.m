  function [] = Lagrange(xx,yy,xc)
    syms x
    n = length(xx);
    L = 0;
    
     % Xay dung cac da thuc L(i,n) va da thuc noi suy Ln(x)
    for i = 1:n
        Lin = 1;
        for j = 1:n
           if i == j
               continue;
           end
           Lin = Lin*((x-xx(j))/(xx(i)-xx(j)));
        end
        L = L + Lin*yy(i);
    end
    
    % Xap xi gia tri yc
    L =matlabFunction(L);
    L 
    for i = 1:length(xc)
        fprintf('f(%.2f) = %f\n',xc(i),L(xc(i)))
    end
    ezplot(L, [xx(1) xx(end)])
    hold on
    plot(xx,yy,'v-')
end