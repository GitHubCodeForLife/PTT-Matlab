function [aEy,rEy] = saiso_2(y,x1_a,aEx1,x2_a,aEx2)
    %Tinh y_a
   syms x1 x2
    y_a = subs(y,[x1,x2],[x1_a,x2_a]);

    %Tinh dao ham rieng
    dy1 = diff(y,x1);
    dy2 = diff(y,x2);
    
    %Tinh gia tri gan dung cua cac dao ham
    dy1_a = subs(dy1,[x1,x2],[x1_a,x2_a]);
    dy2_a = subs(dy2,[x1,x2],[x1_a,x2_a]);
    
    %Tinh sai so tuyet doi aEy va tuong doi rEy
    aEy = abs(dy1_a)*aEx1 + abs(dy2_a)*aEx2;
    rEy = aEy/abs(y_a);
    
end

