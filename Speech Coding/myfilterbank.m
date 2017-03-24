function bank = myfilterbank(N,L,Fs,B)
%FILT_BANK	Filter bank generator template
%   BANK = FILT_BANK(N,L,Fs,B) generates a bank of non-overlapping filters where
%   N is the number of filter bands, L is the length of each FIR filter,  Fs is
%   the sampling frequency in Hz, and B is the width of each band in Hz. BANK is
%   an LxN matrix, where each of the N columns of BANK contains an L-point FIR
%   filter.
%
%   BANK = FILT_BANK(N,L,Fs) automatically selects the bandwidth B so that the N
%   filters span the spectrum from 0 Hz to 3600 Hz.
%
%   BANK = FILT_BANK(N,L) sets Fs to 8000 Hz, and automatically selects the
%   bandwidth B so that the N filters span the spectrum from 0 Hz to 3600 Hz.
%
%   You are responsible for updating this function to make it fully operational.

% Last Modified: 3/8/06, Eric Weiss


% Set Defaults
%-------------
if nargin < 4
    B = 3600/N;  % set default width of each band in Hz
end
if nargin < 3
    Fs = 8000;   % set default sampling frequency in Hz
end
start = B/2;     % First center freq. in Hz

% preallocate output for speed
bank = zeros(L,N);


% Design a prototype lowpass filter
%----------------------------------
% Choose the cutoff frequency to obtain a bandwidth of B.
% We suggest that you use a Kaiser window with beta = 3.
vindow = kaiser(L, 3);
lpf = fir1(L-1,0.5*B/Fs, 'low', vindow);

% Need to make it a column vector
lpf = lpf(:);



% Create bandpass filters
%------------------------
% Now, we have to shift the lowpass filter into a series of bandpass filters
% (See Problem Set 2, #1)
% First, we need to create a discrete-time vector t for argument to cosines.
% The length of t must equal the length of the lowpass filter (L),
% and the spacing between the samples must be equal to 1/Fs.
% Note that t must be a column vector.
t = 0:1:length(lpf);
t = t(1:end-1)';
disc_time_index = t/Fs;


% In loop, design filters for the remaining bands:
for i = 1:N

    % Compute desired center frequency from i, start and B
    cf = start + (i-1)*B;

    % Shift lowpass prototype to center frequency (see Problem Set 2, #1). 
    % Do you need to magnitude-adjust? NO
    bank(:,i) = 2*lpf .* cos(2*pi*cf*disc_time_index);

end
