function [p, next_delay] = pulse_train(period, len, init_delay)
%PULSE_TRAIN Generate a discrete impulse train
%   [PULSE, NEXT_DELAY] = PULSE_TRAIN(PERIOD,LENGTH,INIT_DELAY) generates a
%   discrete impulse pulse train. The period in samples is specified by PERIOD,
%   the length of the pulse train is specified by LENGTH, and the sample delay
%   from the first sample to the first impulse (i.e. the number of leading
%   zeros) is set by INIT_DELAY.
%
%   The output pulse train is returned in vector PULSE, and the delay to the
%   first pulse in the next frame is returned in NEXT_DELAY. To create two
%   consecutive pulse trains with aligned pulse periods, the second pulse train
%   should be created by specifying an INIT_DELAY corresponding to the
%   NEXT_DELAY of the previous pulse train.
%
%   [PULSE, NEXT_DELAY] = PULSE_TRAIN(PERIOD,LENGTH) uses a default INIT_DELAY
%   of zero.

% Last Modified: 3/20/06, Eric Weiss.  p changed to column vector.
% Previously Modified: 3/8/06, Eric Weiss.


% Input argument checking
%------------------------
if nargin < 3
    init_delay = 0;
end;


% Create impulse train
%---------------------
p = zeros(len,1);    % Initialize impulse train output
pulse_times = init_delay+1:period:len;
if ~isempty(pulse_times),
    p(pulse_times) = 1;
    next_delay = max(pulse_times) + period - len - 1; % find delay to next pulse
else
    next_delay = init_delay - len;  % accounts for init delays > length
end
