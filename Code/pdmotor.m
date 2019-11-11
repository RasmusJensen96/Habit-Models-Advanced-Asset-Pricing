function [inside] = pdmotor(v)
% Procedure to be used for numeric integration when calculating
% the fixed point. It has as argument only v ~ N (0, sig). Returns VALUE of
% P / C for each iteration over the current value of s {t} in each iteration.
% ----------------------------------------------------------------------- %
global delta g gamma s sg lnpc debug PD_Claim

s1=strans(s,v);

if PD_Claim == 0 
    
    inside = delta * exp(g*(1-gamma))*exp(-gamma*(s1-s)).*...
             (1+exp(interp(s1,sg,lnpc)))'.*exp((1-gamma)*v);

elseif PD_Claim == 1

    inside = delta * exp(g*(1-gamma))*exp(1/2 * (1-rhow^2) * sig_w^2 ) *...
            exp(-gamma * (s1 - s )) .*  (1+exp(interp(s1,sg,lnpd)))' .* ...
            exp((rhow * sig_w/sig - gamma)*w);

end 


debug(:,2)=inside';



end