function plotWiener(model, noise, observation, utilda, Fs, nwindow)
%PLOTWIENER  Plots results of Wiener filtering
%  PLOTWIENER(MODEL, NOISE, OBSERVATION, UTILDA, FS, NWINDOW) plots the results
%  of Wiener filtering carried out by function wienerFilter.m. Input MODEL is
%  the desired model output, NOISE is the unwanted noise, OBSERVATION is the
%  signal+noise, UTILDA is the Wiener filtered output, FS is the sample
%  rate, and NWINDOW is the window length for pwelch spectral plotting. The
%  default value for NWINDOW is 512.
%
%  Time-domain and frequency-domain PSD plots of observation, noise, model, and
%  Wiener filtered output signals are generated. The PSD plot is generated using
%  the pwelch method.

%  Created by: Gari Clifford
%  Modified 5/6/06, Eric Weiss. Documentation updated; PSD changed to PWELCH.

% Input argument checking
%------------------------
if nargin < 5
    error('Improper function call to plotWiener.m');
end;
if nargin < 6
    nwindow = 512;
end;

% Generate spectral data
%-----------------------
% Use pwelch with 50% overlap (default) and NFFT next power of 2 > data length
[Psig, Fsig] = pwelch(observation,nwindow,[],[],Fs);
[Pm, Fm] = pwelch(model,nwindow,[],[],Fs);
[Pn, Fn] = pwelch(noise,nwindow,[],[],Fs);
[Pw, Fw] = pwelch(utilda,nwindow,[],[],Fs);

% Plot time-domain data
%----------------------
figure;
t=[1/Fs:1/Fs:length(observation)/Fs];
%mn=min(min([model noise observation utilda]));  mn = mn - (0.1*mn);
%mx=max(max([model noise observation utilda]));  mx = mx + (0.1*mx);
subplot(4,1,1); plot(t,observation); ylabel('Observation');
title('Wiener Filter');
subplot(4,1,2);plot(t,model);
%axis([0 max(t) mn mx]);
ylabel('Desired');
subplot(4,1,3);plot(t,noise);
%axis([0 max(t) mn mx]);
ylabel('Noise Est');
subplot(4,1,4);plot(t,utilda);
%axis([0 max(t) mn mx]);
ylabel('Output');
xlabel('time (s)');
if 0
    figure; plot(t,observation);hold on;plot(t,utilda,'r');
    %axis([0 max(t) mn mx]);
    ylabel('Comparison: Observation vs Wiener Filtered Signal');
    xlabel('time (s)');
end;

% Plot frequency-domain data
%---------------------------
figure;
plot(Fm,10*log10(Pm),'g',Fn,10*log10(Pn),'m--',...
    Fsig,10*log10(Psig),'k-.',Fw,10*log10(Pw),'r:');
xlabel('Frequency (Hz)')
ylabel('Power Spectral Density (dB)')
legend('Desired','Noise Estimate','Observation','Output')
axis([0 128 -100 19]);
title('Wiener Filter');

