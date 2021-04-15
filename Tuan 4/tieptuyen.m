function [SOL, A] = tieptuyen(f, a, b, x0, x_ex, tol)
format long
syms x
g = diff(f(x))
g = matlabFunction(g)
k=1;
N_o = k;
rEx = abs((x_ex - x0)/x_ex);

x0 = x0 - f(x0)/g(x0);
xn = x0;

f_xn =  double(f(x0));

if (abs(f(x0)) <= tol)
    Condition = 1;
else
    Condition = 0 ;
end

while (abs(f(x0)) > tol && k <= 50)
    x0 = x0 - f(x0)/g(x0);
    k = k + 1;
    N_o = double([N_o; k]);
    xn = double([xn; x0]);
    f_xn = double([f_xn; f(x0)]);
    
    if (abs(f(x0)) <= tol)
        Condition = double([Condition; 1]);
    else
        Condition = double([Condition; 0]);
    end
    
    rEx = double([rEx; abs((x_ex - x0)/x_ex)]);
end
SOL = double(x0);
Condition = logical(Condition);
A = table(N_o, xn, f_xn, Condition, rEx);

% Draw table
% h = {'N_o' 'xn' 'f(x)' '|f(x) <= Df|' 'rEc'};
% data = cat(2,N_o, xn, f_xn, Condition, rEx);
% f=figure;
% uitable(f,'data',data,'columnname',h);


%draw plot
figure
hold on
grid on
for ii = 1:length(xn)
    if (ii == length(xn))
        plot(xn(ii), f_xn(ii), 'r*', 'LineWidth', 1.5);
    end
    plot(xn(ii),f_xn(ii),'g*');
end
grp1 = fplot(f,[a,b],'c');
grp2 = plot([a,b],[0 0], 'b--');
xlabel('x-axis'); ylabel('y-axis');
legend([grp1 grp2], {'f-function', 'line y = 0'});

end