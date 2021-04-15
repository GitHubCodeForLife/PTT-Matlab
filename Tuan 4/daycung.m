function [SOL, A] = daycung(f, a, b, x_ex, tol)
format long
syms x
k = 1;
N_o = k;
c = a - ((b - a)/(double(f(b)) - double(f(a)))*double(f(a)));
rEx = abs((x_ex - c)/x_ex);   
a_n = a;
b_n = b;
c_n = c;
f_xn =  double(f(c));

if (abs(f(c)) <= tol)
    Condition = 1;
else
    Condition = 0 ;
end

while (abs(f(c)) > tol && k <= 50)
    
    if (double(f(a))*double(f(c)) > 0)
        a = c;
    else
        b = c;
    end
    
    c = a - ((b - a)/(double(f(b)) - double(f(a)))*double(f(a)));
    
    c_n = [c_n; c];
    a_n = [a_n; a];
    b_n = [b_n; b];
    k = k + 1;
    N_o = double([N_o; k]);
    f_xn = double([f_xn; f(c)]);
    
    if (abs(f(c)) <= tol)
        Condition = [Condition; 1];
    else
        Condition = [Condition; 0];
    end
    
    rEx = double([rEx; abs((x_ex - c)/x_ex)]);
end
SOL = double(c);
Condition = logical(Condition);
A = table(N_o, a_n, b_n, c_n, f_xn, Condition, rEx);
hold on
grid on
for ii = 1:length(c_n)
    if (ii == length(c_n))
        plot(c_n(ii), f_xn(ii), 'r*', 'LineWidth', 1.5);
        
    end
    plot(c_n(ii),f_xn(ii),'g*');
end
grp1 = fplot(f,[min(a_n),max(b_n)],'c');
grp2 = plot([min(a_n),max(b_n)],[0 0], 'b--');
xlabel('x-axis'); ylabel('y-axis');
legend([grp1 grp2], {'f-function', 'line y = 0'});

end
