clear all 
clc 
format long
f = @(x) x  + sin(x) -2 
phi = @(x) 2 - sin(x)
xo = 1.05
Df = 10^-3
lap(f, phi, xo, Df)