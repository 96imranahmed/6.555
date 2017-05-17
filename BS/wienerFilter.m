function [yhat, H] = wienerFilter(desired,observation,graphicsFlagOn,Fs);
%WIENERFILTER  Apply Wiener filter to input data (template)
%  [YHAT, H] = WIENERFILTER(DESIRED_DATA,OBSERVED_DATA) creates a non-causal
%  Wiener filter from input signals DESIRED_DATA (the signal)and OBSERVED_DATA
%  (signal plus noise), and applies this filter to the OBSERVED_DATA input.
%  Output YHAT is the Wiener filtered output signal, and H is the Wiener
%  filter's frequency response.
%
%  This function automatically generates a plot of the results by calling
%  function plotWiener.m. To prevent graphical output, pass a third input
%  argument equal to zero. For plotting, a sample frequency of 256 Hz is
%  assumed. You may pass a fourth input argument FS to change this:
%     WIENERFILTER(DESIRED_DATA,OBSERVED_DATA,0,FS)
%
%  You must update this function to make it fully operational.
% 
% IMPORTANT CONCEPTUAL NOTE: Designing a Wiener filter requires knowledge of the 
% POWER SPECTRUM of the desired signal and the POWER SPECTRUM of the noise signal. 
% It does not require the time-domain signals themselves; if we had those signals, 
% there would be no need for the Wiener filter. This m-file estimates the power 
% spectra, creates and applies the Wiener filter, and plots the result.      

% G.D. Clifford 2004 gari AT mit DOT edu
% Licensing: GNU GPL applies
% Documentation updated 5/06/06, Eric Weiss
% Documentation updated 5/14/15, Rachelle Horwitz-Martin
% Documentation updated 4/11/16, Christopher Dean

% Input argument checking
if nargin < 4
    Fs = 256;
end
Fs = round(Fs);
if nargin < 3
    graphicsFlagOn = 1;
end

% Estimate noise from desired signal
%-----------------------------------
% The noise model is the difference between the observation and the desired
% signal
% **** complete this
noise = observation - desired;

% Wiener filter
%--------------
Sf2 = pwelch(desired,[],[],[],[],'twosided');
Nf2 = pwelch(noise,[],[],[],[],'twosided');

% Create frequency response of Wiener filter
%-------------------------------------------
% **** complete this
H = Sf2 ./(Sf2 + Nf2);

% Compute impulse response (filter coefficients) from 
% frequency response of Wiener filter
%----------------------------------------------------
% *** complete this
h = ifft(H);

% Apply impulse response of Wiener filter to observation using fftfilt
%---------------------------------------------------------------------
% *** complete this
yhat = fftfilt(h,observation);

% Plot the data?
%---------------
if graphicsFlagOn==1
    plotWiener(desired, noise, observation, yhat, Fs);
end;
