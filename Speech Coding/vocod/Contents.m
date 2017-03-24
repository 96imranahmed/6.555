%Speech Coding Toolbox for HST.582J/6.555J
%Version 2.01 (R14SP3) 20-Mar-2006
%
% Pitch Detection
%   cclip        - Performs center clipping of input signal
%   peak         - Detects autocorrelation fundamental peak
%   pitch_detect - Pitch detection template
%
% Source Generation
%   pulse_train  - Generate a discrete impulse train
%  
% Channel Vocoder
%   filt_bank    - Filter bank generator template
%   chvocod_ana  - Channel vocoder analyzer template
%   chvocod_syn  - Synthesizes speech waveform from pitch and band envelope signals
%
% LP Vocoder
%   lpcoef       - Generates linear prediction coefficients and gain
%   lpvocod_ana  - Speech waveform analyzer template
%   lpvocod_syn  - Speech waveform synthesizer template
%
% Spectrogram
%   specgram6555 - Special spectrogram function call
%