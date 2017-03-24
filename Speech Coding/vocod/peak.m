function [peakval,peakindex] = peak(x)
%PEAK Detects autocorrelation fundamental peak
%   [PEAKVAL, PEAKINDEX] = PEAK(X) locates the value and index of the largest
%   peak in the vector X other than Rx[0].  X must be an autocorrelation
%   function with maximum value Rx[0] as its first element.

% Author: J. Greenberg, 3/19/93
% Last Modified: 3/8/06, Eric Weiss


% Input argument checking
%------------------------
if nargin == 0
    error('You must enter an autocorrelation function as input.');
end;
if (size(x,1) > 1) && (size(x,2) > 1)
    error ('The input signal must be a vector')
end;

% Processing
%-----------
x = x(:);
if x(1) ~= max(x)
    error('Input must be an autocorrelation function with Rx[0] as the first element')
end;

% Processing
%-----------
positive_slope = find(diff(x)>0);
start_index = positive_slope(1);

[peakval, peakindex] = max(x(start_index:end)); % find max value
peakindex = peakindex + start_index - 1;        % adjust for start index offset

