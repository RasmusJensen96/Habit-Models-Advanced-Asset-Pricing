function [out] = intelnr(v)

% Provides the expected return value according to a normal distribution.
% ----------------------------------------------------------------------- %

global sig
out = (1/(sig*(2*pi)^(.5)))*exp(-.5*(v/sig).^2).*log(erinsd(v));
end