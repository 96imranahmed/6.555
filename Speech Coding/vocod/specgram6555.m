function [S,F,T,P] = specgram6555(varargin)
%SPECGRAM6555  Special spectrogram function call
%   SPECGRAM6555 is called using the same syntax as the function SPECTROGRAM,
%   but includes an optional dynamic range adjustment input to allow the user to
%   optimize the spectrogram color resolution and automatically plots the output
%   in grayscale for optimal incorporation into a lab report.
%
%   Please refer to the documentation for SPECTROGRAM for full function
%   specification.
%
%   SPECGRAM6555(..., 'range',DYNAMIC_RANGE) specifies the dynamic range, in dB,
%   to plot in the spectrogram plot. If not included, the default value is 60
%   dB.
%
%   The differences between SPECTROGRAM and SPECGRAM6555 are as follows:
%     1. SPECGRAM6555 allows the input of an additional DYNAMIC_RANGE parameter
%         to optimize the display of the spectrogram plot.
%     2. SPECGRAM6555 plots an optimized grayscale spectrogram with colorbar
%         with time as the x axis and frequency as the y axis. This color scheme
%         was specified for easy inclusion into a black-and-white lab report
%         printout.
%     3. SPECGRAM6555 automatically plots a spectrogram, even when output
%        arguments are included in the function call.

% Author: Eric Weiss  (rewritten from specgram base to spectrogram base)
% Last Modified: 3/20/06, Eric Weiss


% Input argument checking
%------------------------
if strcmpi(varargin{end-1},'range')
    dynamic_range = varargin{end};
    varargin = varargin(1:end-2);
    display_range = 1;
else
    dynamic_range = 60;  % in dB
    display_range = 0;
end;

% Call function SPECTROGRAM
%--------------------------
[S,F,T,P] = spectrogram(varargin{:});

% Adjust dynamic range
%---------------------
maxP = max(max(P));
minP = min(min(P));
os = (maxP-minP*10^(dynamic_range/10))/(10^(dynamic_range/10)-1);
if display_range
    fprintf('Dynamic Range = %0.1f dB.\n',10*log10(maxP/minP));
    fprintf('Adjusted Dynamic Range = %0.1f dB.\n',10*log10((maxP+os)/(minP+os)));
end;


% Plot the spectrogram
%---------------------
surf(T,F,10*log10(abs(P)+os),'EdgeColor','none');
view(0,90); box on; axis xy; axis tight; colormap(1-gray); colorbar;
xlabel('Time (sec)');
ylabel('Frequency (Hz)');
