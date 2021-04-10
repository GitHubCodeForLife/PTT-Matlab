clear all; clc;
%Cau a. Bieu thuc chua 2 bien
syms x1 x2
y = x1*x2 + x1 +x2
x1_a = 2
x2_a = 3
aEx1 = 0.05
aEx2 = 0.04
[aEy, eRy] = saiso_2(y,x1_a,aEx1,x2_a,aEx2)

%% Cau b: Bieu thuc chau 3 bien
syms x1 x2 x3
y = x1 + x2*x3
x1_a = 5, aEx1 = 0.03
x2_a = 3, aEx2 = 0.06
x3_a = 7, aEx3 = 0.04
[aEy, rEy] = saiso_3(y,x1_a,aEx1,x2_a,aEx2,x3_a,aEx3)

%% Cau c: n bien
syms x1 x2 x3
f = x1 + x2*x3
[aEy,rEy]=saiso_n(f,[5 3 7],[0.03;0.06;0.04],3)
f = x1*x1 + x2*x3^2
[aEy,rEy]=saiso_n(f,[2 4 6],[0.05;0.02;0.03],3)




