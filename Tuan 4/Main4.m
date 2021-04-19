clear all
clc
syms x


%Giải bai tap 1
tol = 10^(-3);
a = 7;

b = 8;
f = @(x) x^2  - sin(x) - 50
x_ex = vpasolve(f(x) == 0,x,[a, b]);


fprintf('------------------------END: tiep tuyen ---------------\n');
x0 = 7.5
[SOL ,A] = tieptuyen(f,a,b,x0,x_ex,tol)


%Giải bai tap 2

tol = 10^(-3);
a = -2;
b = -1;
f = @(x)x^3 - 6*x^2 + 2*x + 25
x_ex = vpasolve(f(x) == 0,x,[a, b]);


fprintf('------------------------END: tiep tuyen ---------------\n');
x0 = (a+b)/2
[SOL ,A] = tieptuyen(f,a,b,x0,x_ex,tol)
