%%13a
clear all; clc;
syms x y
u = log(2*y+x^2)
[aEy, rEy]  =lamtron(u,1.976,0.532/1.976)
%%13b
u = y*exp(x)-x^2
[aEy, rEy]  =lamtron(u,1.675,1.703)
%%13c
u = x*tan(y)+(x+y)^2
[aEy, rEy]  =lamtron(u,1.675,1.703)