function [I_a,rEI] = gauss2dn(f,a,b)
    syms t;
    I_e = int(f,t,a,b);
    w1 = 1; x1 = -0.5774; t1 = (b-a)*x1/2 + (a+b)/2;
    w2 = 1; x2 = 0.5774; t2 = (b-a)*x2/2 + (a+b)/2;

    f = matlabFunction(f);
    I_a = (b-a)/2 * (w1*f(t1) + w2*f(t2));
    rEI = abs((I_e - I_a)/I_e);
end