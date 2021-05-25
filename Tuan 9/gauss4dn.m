function [I_a,rEI] = gauss4dn(f,a,b)
    syms t;
    I_e = int(f,t,a,b);
    w1 = 0.3479; x1= -0.8611; t1 = (b-a)*x1/2 + (a+b)/2;
    w2 = 0.6521; x2= -0.3340;       t2 = (b-a)*x2/2 + (a+b)/2;
    w3 = 0.6521; x3= 0.3340;  t3 = (b-a)*x3/2 + (a+b)/2;
    w4 = 0.3479; x4= 0.8611;  t4 = (b-a)*x4/2 + (a+b)/2;

    f = matlabFunction(f);
    I_a = (b-a)/2 * (w1*f(t1) + w2*f(t2) + w3*f(t3) + w4*f(t4));
    rEI = abs((I_e - I_a)/I_e);
end