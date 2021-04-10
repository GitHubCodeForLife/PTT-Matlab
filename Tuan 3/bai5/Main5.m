clear all
clc
format long
f = @(x)exp(x) - x - 3;
A = [0 3 10^-3;
    0 2 5*10^-3;
    -3 0 10^-4;
    -3 -1 10^-4]
C = fuc5(f,A)
