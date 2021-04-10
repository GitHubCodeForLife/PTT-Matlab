function [ANS] = F6(F, PHI, X0, DELTA)
    k = 1
    [ column, row] = size(DELTA)
    while k <= column
        lap(F(k), PHI(k),X0(k),DELTA(k))
        k = k + 1
    end
end