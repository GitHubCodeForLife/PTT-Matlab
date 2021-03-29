function [aEy, rEy] = lamtron(f,x_a,y_a) 
     syms x y
     p_a = vpa(subs(f, [x,y],[x_a,y_a]))
     p_e = round(p_a,3)
     [aEy,rEy] = saiso(p_e,p_a) 
 end 