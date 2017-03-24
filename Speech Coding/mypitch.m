function pitch = mypitch(x, clip_thresh, unvoiced_thresh)
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
x = cclip(x, clip_thresh*min(x), clip_thresh*max(x));

% Compute the autocorrelation of the segment...
autocorr_x = xcorr(x);

% Find the maximum peak following Rx[0] by making the proper function call to
% "peak.m"...
half = round(length(autocorr_x)/2);
[sec_peak, peak_index] = peak(autocorr_x(half+1:end));

% Determine if the segment is unvoiced based on the 'voicing strength' (the
% ratio of the autocorrelation function at the peak pitch lag to the
% autocorrelation function at lag=0)...
peak_max = max(autocorr_x);
is_voiced = sec_peak/peak_max > unvoiced_thresh;
if is_voiced
    time_index = peak_index/Fs;
    pitch = 1/time_index;
else
    pitch = 0;
end


