function [coeff, gain, pitch] = lpvocod_ana(x,p)
%LPVOCOD_ANA  Speech waveform analyzer template
%   [COEFF,GAIN,PITCH] = LPVOCOD_ANA(X,P) analyzes the speech waveform using an
%   LP vocoder. Input X is the speech waveform vector, and input P is the order
%   of the LPC model. The speech vector is split into 30 ms frames, with 50%
%   overlap between frames. Output COEFF is the matrix of LP coefficients, where
%   each column index is a frame number, and each row index is a coefficent
%   number. GAIN is a vector of gain values (one per frame). PITCH is a vector
%   of pitch values (one per frame), where 0 = unvoiced.
%
%   You are responsible for updating this function to make it fully operational.

% Last Modified: 3/22/06, Eric Weiss; ; 2/21/14, Julie Greenberg

% Make x a column vector just to be sure.
x = x(:);

% Initialize variables for loop.
Fs = 8000;			        % sampling frequency
frlen = floor(0.03*Fs);	    % length of each data frame, 30ms
noverlap = floor(frlen/2);  % overlap of successive frames, half of frlen
hop = frlen-noverlap;	    % amount to advance for next data frame
nx = length(x);	            % length of input vector
len = fix((nx - (frlen-hop))/hop);	%length of output vector = total frames

% preallocate outputs for speed
[gain, pitch] = deal(zeros(1,len));
coeff = zeros(p+1, len);

% Design (but do not yet apply) a lowpass filter with 500 Hz cutoff
% frequency, since we're interested in pitch, which is 80-320 Hz for
% adult voices. Make the filter length substantially shorter than the
% frame length...
lpf = fir1(round(0.5*frlen), 500/Fs);

% Here's the loop. Each iteration processes one frame of data.

for i = 1:len
    % Get the next frame of the unfiltered input signal.
    % The indexing has been done for you.
    seg = x(((i-1)*hop+1):((i-1)*hop+frlen));

    % Compute the LPC coefficients and gain of the frame ('lpcoef')
    % and store in coeff matrix and gain vector...
    [coeff_ret, gainz_ret] = lpcoef(seg,p);
    coeff(:, i) = coeff_ret;
    gain(i) = gainz_ret;
    % Compute the LP error signal
    F = [0:1:Fs/2];
    time_error_sig = filter(coeff_ret,1,seg);
    lpf_time_error_sig = fftfilt(lpf,time_error_sig);
    pitch(i) = mypitch(lpf_time_error_sig, 0.75, 0.20);
    % Detect voicing and pitch for this frame by applying 500 Hz lowpass filter
    % to error signal and then calling your pitch detector...

end;  		% end for loop

% Remove spurious values from pitch signal with median filter...
pitch = medfilt1(pitch);

