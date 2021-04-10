function [C] = fuc5(f,A)
    [row , col] = size(A);
    C = zeros(row,2);
    for ii = 1:row
        [c, fc] = chiadoi(f,A(ii,1),A(ii,2),A(ii,3));
        C(ii,1) = c;
        C(ii,2) = fc;
    end
end

