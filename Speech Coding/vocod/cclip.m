function clipped = cclip(x,minval,maxval)
%CCLIP Performs center clipping of input signal
%   Y = CCLIP(X,MINVAL,MAXVAL) center clips the signal X. MINVAL and MAXVAL set
%   the lower and upper clipping threshold, respectively. Signal components
%   between MINVAL and MAXVAL are 'center clipped', while components below 
%   MINVAL are shifted up and compoents above MAXVAL are shifted down. MINVAL 
%   must be negative and MAXVAL must be positive. Each elements of X is 
%   processed as follows:
%      If X(i) > MAXVAL, then Y(i) = X(i) - MAXVAL;
%      If MINVAL < X(i) < MAXVAL, then Y(i) = 0;
%      If X(i) < MINVAL, then Y(i) = X(i) - MINVAL;

% Author: J. Greenberg, 3/19/93
% Last Modified: 3/8/06, Eric Weiss


% Input argument checking
%------------------------
if nargin < 3
    error('You must enter three input arguments.');
end;
if (size(x,1) > 1) && (size(x,2) > 1)
   error ('Signal must be a vector');
end
if (length(maxval) > 1) || (length(minval) > 1)
   error ('Minimum and maximum values must be scalars');
end
if (maxval < 0) || (minval > 0)
   error ('Minimum value must be negative and maximum value must be positive');
end

% Processing
%-----------
x = x(:);
nx = length(x);
zz = zeros(nx,1);
oo = ones(nx,1);
maxx = maxval * oo;
minn = minval * oo;

upper = max(x-maxx,zz);
lower = min(x-minn,zz);
clipped = upper + lower;





