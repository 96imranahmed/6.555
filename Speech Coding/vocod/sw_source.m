function [out,next_delay] = sw_source(pitch,Fs,frlen,init_delay)
%SW_SOURCE  Creates source signal from pitch/voicing data
%   [SOURCE,NEXT_DELAY] = SW_SOURCE(PITCH,FS,FR_LEN,INIT_DELAY) generates speech
%   source signal SOURCE from the vector of pitch values PITCH (in Hz). FS is
%   the sampling frequency in Hz, FR_LEN is the frame length in samples, and
%   INIT_DELAY is the initial delay to the first pulse in samples. If
%   INIT_DELAY is not specified, the default value is zero.
%
%   For nonzero values of PITCH, SOURCE contains a pulse train at the pitch
%   rate; when PITCH is zero, SOURCE contains white noise.

% Last Modified: 3/19/06, Eric Weiss

% Input argument checking
if nargin  < 3
    error('SW_SOURCE: Improper function call.');
end;
if nargin < 4
    init_delay = 0;
end;

nframes = length(pitch);
out = zeros(frlen*nframes,1);

next_delay = init_delay;
for i = 1:length(pitch)
    if pitch(i) > 0
        pitchPeriod = floor(Fs/pitch(i));
        [source,next_delay] = pulse_train(pitchPeriod,frlen,next_delay);
    else
        source = randn(frlen,1);
    end;
    if norm(source) ~= 0
        source = source/norm(source);  % ensure unit energy per frame
        % optional: norm(source,inf): normalizes amplitude versus energy
    end;
    out((i-1)*frlen+1:i*frlen) = source;
end;
