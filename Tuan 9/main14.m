clear all
clc
syms x

%% Cau5:
f1 = exp(x)
a1 = 2;
b1 = 4;
[I_a,rEI] = gauss3dn(f1,a1,b1)

%% Cau6:
f2 = sin(x)
a2 = 0;
b2 = pi;
[I_a2,rEI2] = gauss3dn(f2,a2,b2)