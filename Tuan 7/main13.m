clear all
clc

%% Cau a:
xx = [2; 4; 7; 8];
yy =[2.2;1.8;2.7;3.1];
xc = [3,7.5];
Spline_4so(xx,yy,xc)

%% Cau b:
xx = [2.2; 3.6; 4.9; 5.2; 5.7; 6.1];
yy = [1.4; 3.2; 5.1; 4.4; 3.9; 3.2];
xc = [4,5.5];
Spline_6so(xx,yy,xc)