clear all
clc
syms x

f = exp(x) + 2^(-x)+2*cos(x) - 6
g = sin(x) + exp(-x)
INPUT = [f;
         (x-2)^2 - log(x);
         g ;
         log(x-1)+cos(x-1)]
[row, col] = size(INPUT)

x_ex = 0
a = 0 
b = 0
tol = 10^-3

for ii = 1:row
    f= matlabFunction(INPUT(ii))
    fprintf('------------------------END: tiep tuyen ---------------\n');
    x0 = 2.5
    [SOL ,A] = tieptuyen(f,a,b,x0,x_ex,tol)
    fprintf('------------------------END: Day Cung ---------------\n');
    a = SOL - 1
    b = SOL + 1
    [SOL ,A] = daycung(f, a, b, x_ex, tol)
end


