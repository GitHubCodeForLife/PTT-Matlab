clear all
clc
syms x


%Giải bai tap 1
a = 0;
b = 12;

f = @(x) x + log(x+2) - 10
x_ex = vpasolve(f(x) == 0,x,[a, b]);

INPUT = [7 10^-3;
    9 10^-3;
    5 5*10^-3;
    3 5*10^-3]

[row, col] = size(INPUT)
for i = 1:row
    fprintf('------------------------END: tiep tuyen ---------------\n');
    x0 = INPUT(i,1)
    tol = INPUT(i,2)
    [SOL ,A] = tieptuyen(f,a,b,x0,x_ex,tol)
end

