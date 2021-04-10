 function [aEp, rEp] = saiso(p_e, p_a) 
     aEp = abs(p_e-p_a)
     rEp  = aEp/abs(p_e)
 end