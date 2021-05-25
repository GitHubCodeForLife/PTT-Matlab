function [df_3DC,rEdf_3DC,df_3DG,rEdf_3DG] = ba_diem(xx,yy,xc,df)
    n = length(xx);
    for ii = 1:length(xc)
        k = 1;
        while (k<=n)
            if (xc(ii) >= xx(k) && xc(ii) <= xx(k+1))
                break;
            end
            k = k + 1;
        end
        df_3DC = (-3*yy(k)+4*yy(k+1)-yy(k+2))/(xx(k+2)-xx(k));
        rEdf_3DC = abs((df-df_3DC)/df);
        df_3DG = (-yy(k-1)+yy(k+1))/(xx(k+1)-xx(k-1));
        rEdf_3DG = abs((df-df_3DG)/df);
    end
end