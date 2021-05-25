function [I_a,rEI] = gauss3dn(f,a,b)
    syms t;
    I_e = int(f,t,a,b);
    w1 = 0.5556; x1= -0.7746; t1 = (b-a)*x1/2 + (a+b)/2;
    w2 = 0.8889; x2= 0;       t2 = (b-a)*x2/2 + (a+b)/2;
    w3 = 0.5556; x3= 0.7746;  t3 = (b-a)*x3/2 + (a+b)/2;

    f = matlabFunction(f);
    I_a = (b-a)/2 * (w1*f(t1) + w2*f(t2) + w3*f(t3));
    rEI = abs((I_e - I_a)/I_e);
end