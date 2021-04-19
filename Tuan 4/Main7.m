clear all
clc
syms x


f = @(x) 2^(x) + 3^(x) - 10*x - 30

INPUT = [-5 -3 10^-3;
    -4 -2 2*10^-3;
    2 4 3*10^-3;
    2 4 3*10^-3]

[row, col] = size(INPUT)
x_ex = 0
for ii = 1:row
    fprintf('------------------------END: Day Cung ---------------\n');
    a = INPUT(ii,1)
    b = INPUT(ii,2)
    tol = INPUT(ii, 3)
%     x_ex = vpasolve(f(x) == 0,x,[a, b]);
    [SOL ,A] = daycung(f, a, b, x_ex, tol)
end

