function pitch = pitch_detect(x, clip_thresh, unvoiced_thresh)
%PITCH_DETECT Pitch detection template
%   PITCH = PITCH_DETECT(X,CLIP_THRESH,UNVOICED_THRESH) receives a segment of
%   speech waveform data X, center clips the signal at CLIP_THRESH (a scaling
%   factor of the max/min values), and automatically detects the pitch from the
%   signal's autocorrelation function. The input vector X is the speech waveform
%   sampled at 8 kHz, and the scalar output PITCH is the pitch output in Hz (or
%   0 if unvoiced). If no CLIP_THRESH is entered, the default value is 0.75
%   (75%). The input UNVOICED_THRESH sets the minimum allowable relative pitch
%   peak amplitude, below which the segment is considered unvoiced. If no
%   UNVOICED_THRESH is entered, the default value is 0.25 (25%).
%
%   You are responsible for updating this function to make it fully operational.

% Last Modified: 3/18/06, Eric Weiss; 2/21/14, Julie Greenberg

% Input argument checking
if nargin == 0
    error('You must enter a filtered speech signal.');
end;
if nargin < 2
    clip_thresh = 0.75;
end;
if nargin < 3
    unvoiced_thresh = 0.25;
end;

Fs = 8000;  % sample rate = 8 kHz

% First, remove the DC value by subtracting the mean.
x = x - mean(x);

% Then find the minimum and maximum samples and center clip using "cclip.m"...


% Compute the autocorrelation of the segment...


% Find the maximum peak following Rx[0] by making the proper function call to
% "peak.m"...


% Determine if the segment is unvoiced based on the 'voicing strength' (the
% ratio of the autocorrelation function at the peak pitch lag to the
% autocorrelation function at lag=0)...


% If voicing strength is less than unvoiced_thresh, call it unvoiced and set
% pitch = 0, otherwise compute the pitch...

