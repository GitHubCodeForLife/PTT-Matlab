function [aEy,rEy] = saiso_3(y,x1_a,aEx1,x2_a,aEx2,x3_a, aEx3)
    %Tinh y_a
   syms x1 x2 x3
    y_a = subs(y,[x1,x2,x3],[x1_a,x2_a,x3_a]);

    %Tinh dao ham rieng
    dy1 = diff(y,x1);
    dy2 = diff(y,x2);
    dy3 = diff(y,x3);
    %Tinh gia tri gan dung cua cac dao ham
    dy1_a = subs(dy1,[x1,x2,x3],[x1_a,x2_a,x3_a]);
    dy2_a = subs(dy2,[x1,x2,x3],[x1_a,x2_a,x3_a]);
    dy3_a = subs(dy3,[x1,x2,x3],[x1_a,x2_a,x3_a]);
    
    %Tinh sai so tuyet doi aEy va tuong doi rEy
    aEy = abs(dy1_a)*aEx1 + abs(dy2_a)*aEx2+abs(dy3_a)*aEx3;
    rEy = aEy/abs(y_a);
    
end