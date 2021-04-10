clear all 
clc 
format long
syms x
F = [ x + sin(x) - 2 ;  x^2 + x - 5 ]
PHI = [ 2 - sin(x) ;  5 - x^2 ]
X0 =  [1.05 ; 1.5]
DELTA = [10^-3; 10^-3]
F6(F, PHI, X0, DELTA)