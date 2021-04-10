function [aEy,rEy] = saiso_n(f,Xa,aEX,n )
    X = sym('x',[1 n])
    syms(X)
    y_a = subs(f,X,Xa)    
    Df =  gradient(f,X)
    A = subs(Df,X,Xa).*aEX
    aEy = sum(A)
    rEy = aEy/abs(y_a)    
end