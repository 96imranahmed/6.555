function [coeff, gain] = lpcoef(x,p)
%LPCOEF  Generates linear prediction coefficients and gain
%   [COEFF,GAIN] = LPCOEF(X,P) generates the linear prediction coefficients and
%   gain of an all-pole LP model filter generated from sound waveform vector X
%   using a Pth order model. The function returns the coefficient vector COEFF
%   and the scalar gain value GAIN. The COEFF output is a vector of size P+1
%   containing the coefficients: 
%                           ^
%                      [1  -a_k]

% Author: J. Greenberg, 3/4/93
% Last Modified: 3/8/06, Eric Weiss


% Input argument checking
%------------------------
if (size(x,1) > 1) && (size(x,2) > 1)
    error ('Signal must be a vector');
end
if (length(p) > 1)
    error ('Model order must be a scalar');
end;


% Processing
%-----------
x = x(:);
xlen = length(x);

rlong = xcorr(x);
r = rlong(xlen+1:xlen+p);
R = toeplitz(rlong(xlen:xlen+p-1));
coeftemp = R\r;
gain = sqrt(rlong(xlen) - coeftemp' * r);
coeff = [1; -coeftemp];


% Optionally
%-----------
%[coeff, gain] = aryule(x,p);
%coeff = coeff(:);
%gain = sqrt(gain*length(x));
