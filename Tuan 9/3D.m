function [] = PP_3DG(xx,yy,df)
    n = length(xx)
    mid = round(n/2,0)-1
    df_3DG = (-yy(mid-1)+yy(mid+1))/(xx(mid+1)-xx(mid-1))
    rEf_3DG = abs((df-df_3DG)/df)
end

function[]  = PP_3DC(xx,yy,df)
    n = length(xx)
    mid = round(n/2,0)-1
    df_3DC = (-3*yy(mid)+4*yy(mid+1)-yy(mid+2))/(xx(mid+2)-xx(mid))
    rEf_3DC = abs((df-df_3DC)/df)
end