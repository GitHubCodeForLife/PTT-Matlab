function [df_SPT,rEf_SPT] = SPT(xx,yy,df)
    n = length(xx)
    mid = round(n/2,0)-1
    df_SPT = (yy(mid+1)-yy(mid))/(xx(mid+1)-xx(mid))
    rEf_SPT = abs((df-df_SPT)/df)
end

function[df_SPT,rEf_SPT]  = SPL(xx,yy,df)
    n = length(xx)
    mid = round(n/2,0)-1
    df_SPT = (yy(mid)-yy(mid-1))/(xx(mid)-xx(mid-1))
    rEf_SPT = abs((df-df_SPT)/df)
end