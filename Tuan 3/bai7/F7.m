function X = F7(f, phi, INPUT)
    [column, row] = size(INPUT);
    for i = 1:column
        lap(f,phi,INPUT(i,1),INPUT(i,2));
    end
end