function y = lpvocod_syn(coeff, gain, pitch, fr_int)
%LPVOCOD_SYN  Speech waveform synthesizer template
%   OUT = LPVOCOD_SYN(LPCOEFFS,GAINS,PITCH,FR_INT) synthesizes the speech
%   waveform encoded by a LP vocoder specified by LPCOEFFS, GAINS, and PITCH.
%   LPCOEFFS is a matrix where each column corresponds to the LP coeffiencts for
%   each speech frame. GAINS contains the gain values for each frame, and PITCH
%   contains the pitches for each frame. FR_INT is the frame duration, in
%   seconds. If FR_INT is not specified, the default value is 0.015 (15 ms).
%   OUT is the synthesized speech signal.
%
%   You are responsible for updating this function to make it fully operational.

% Last Modified: 3/20/06, Eric Weiss

% input argument checking
if (nargin < 3)
    error('There must be 3 or 4 input arguments');
end;
[nrows, nframes] = size(coeff);
if nframes ~= length(pitch)
    error('Pitch vector has illegal length');
end;
if nframes ~= length(gain)
    error('Gain vector has illegal length');
end;
if (nargin < 4)
    fr_int = 0.015; % default: 15 ms frame interval
end;

% Initialize variables
Fs = 8000;			      % sampling frequency
frlen = round(fr_int*Fs);

% Preallocate output for efficiency
y = zeros(nframes*frlen,1);
filt_state = zeros(nrows-1,1);
init_delay = 0;	          % delay to first pitch pulse


% Loop over frames to generate total source signal
for i = 1:nframes
    % Pitch value for each frame indicates if voicing source or noise source
    if pitch(i) > 0
        % Compute pitch period (in samples) and generate impulse train
        % ('pulse_train'). Be sure to save new delay for next frame...

    else
        % Generate noise source ('randn')...

    end;

    % Normalize source signal to have unit energy
    % (to be consistent with assumption made in the analysis stage)
    % Take care not to divide by zero...

    %  Now, filter source signal through LP model filter, keeping track of the
    %  filter state to avoid discontinuities...

    % Insert frame into output signal...
    y((i-1)*frlen+1:i*frlen) =
end;
