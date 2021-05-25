function [] = tinhhs_Hkn(n)
    syms x
    H = x*ones(1,n+1);
    fun = x;
  
    for ii = 1:n
        fun = fun * (x-ii);
    end
    
    for ii = 1:n+1
        k = (((-1)^(n-ii-1)*nchoosek(n,ii-1))/(n*factorial(n)));
        H(ii) = fun / (x-ii+1);
        fprintf('H(%d,%d) = %.8f\n', ii-1, n, k*int(H(ii),x,0,n));
    end
end