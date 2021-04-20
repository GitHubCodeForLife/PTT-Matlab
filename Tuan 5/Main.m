clear all
clc
format long

% nhap A vc C
A = [5 1 1; 1 10 1; 1 1 20];
C = [7;12;22];
tol = 10^-3;
fprintf("---------PHuong phap lap--------\n");
lap(A,C, tol);
fprintf("---------PHuong phap seidel--------\n");
Seidel(A,C,tol);


A = [6 1 1 1 1;
2 9 3 1 2;
2 1 10 4 2;
1 2 1 8 3;
2 1 2 3 9];
C = [9;1;-12;-12;5];
tol = 10^-3;
fprintf("---------PHuong phap lap--------\n");
lap(A,C, tol);
fprintf("---------PHuong phap seidel--------\n");
Seidel(A,C,tol);
