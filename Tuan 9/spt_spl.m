function [df_SPT,rEdf_SPT,df_SPL,rEdf_SPL] = spt_spl(xx,yy,xc,df)
    n = length(xx);
    for ii = 1:length(xc)
        k = 1;
        while (k<=n)
            if (xc(ii) >= xx(k) && xc(ii) <= xx(k+1))
                break;
            end
            k = k + 1;
        end
        df_SPT = (yy(k+1)-yy(k))/(xx(k+1)-xx(k));
        rEdf_SPT = abs((df-df_SPT)/df);
        df_SPL = (yy(k)-yy(k-1))/(xx(k)-xx(k-1));
        rEdf_SPL = abs((df-df_SPL)/df);
    end
end