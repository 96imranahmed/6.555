function y = chvocod_syn(band_envelopes,pitch,R)
%CHVOCOD_SYN  Synthesizes speech waveform from pitch and band envelope signals
%   OUT = CHVOCOD_SYN(BAND_ENVELOPES,PITCH,UPSAMPLE) synthesizes the speech
%   signal encoded by a channel vocoder with frequency band envelopes specified
%   by matrix BAND_ENVELOPES and pitch values specified by vector PITCH. The
%   signal is upsampled by the value specified in UPSAMPLE.
%
%   Each column of BAND_ENVELOPES contains all frame information within each
%   frequency band. Each row of BAND_ENVELOPES contains all frequency band
%   information within each data frame. PITCH contains the pitch information for
%   each data frame.

% Last Modified: 3/18/06, Eric Weiss; 1/27/16, Christopher Dean

% Initialize variables
%---------------------
Fs = 8000;		     % Sampling frequency
frame_length = R;    % length of each frame in samples
N = size(band_envelopes,2);  % Determine number of bands from input matrix

% Compute FIR coefficients for the filter bank
L = 65;  % length of each filter
bank = myfilterbank(N,L);

% Generate a voiced source signal using pulse_train
src = sw_source(pitch,Fs,frame_length);

% Compute length of source signal . . .
M = length(src);

% Preallocate output matrix for efficiency
ybands = zeros(M,N);

% In loop, process each band:
for i = 1:N
    % Interpolate (upsample) each decimated band envelope
    % and replace any negative values with zeros . . .
    xint = interp(band_envelopes(:,i),R);
    xint(xint<0) = 0;

    % Multiply with source, trimming the interpolated signal to
    % match pulse train length, M.
    yint = xint(1:M) .* src;

    % Apply bandpass filter . . .
    ybands(:,i) = fftfilt(bank(:,i),yint);
end

% Add up the output of all of the bands to generate result . . .
y = sum(ybands,2);

