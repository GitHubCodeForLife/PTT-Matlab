clear all 
clc 
format long
syms x
f = x - x/2 - 1/x
phi = x/2 + 1/x

INPUT = [1 10^-3;
    2 3*10^-3;
    -2 10^-2;
    -5 10^-4]
F7(f,phi,INPUT)