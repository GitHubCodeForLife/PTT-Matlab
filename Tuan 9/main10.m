clear all
clc
%% Bai3
xx = [1, 2, 3, 4, 5, 6, 7];
yy = [4, -6, -14, -14, 0, 34, 94];
I_e = 42;
[I_a,rEI] = simpson13(xx,yy,I_e)

%% Bai4
xx = [-2, -1, 0, 1, 2, 3, 4];
yy = [24, 1, 4, 3, -8, -11, 36];
I_e = 7.2;
[I_a,rEI] = simpson13(xx,yy,I_e)