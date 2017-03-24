close all
folder = fileparts(which('ch_voc.m')); 
addpath(genpath(folder));

speech_mat = load('vocod/data/cw161_8k.mat');
speech_mat = speech_mat.cw161;

% time = 0:1/8000:length(speech_mat)/8000;
% time = time(1:end-1)';
% vec1 = time > 0.76;
% vec2 = time < 0.86;
% vec = logical(vec1 .* vec2);
% time_clean = time(vec);
% sig_clean = speech_mat(vec);
% 
% [coeff, gainz] = lpcoef(sig_clean,12);
% F = [0:0.5:4000];
% Fs = 8000;
% [H,F_actual] = freqz(gainz,coeff, F, Fs);
% hold all
% vec = abs(fft(sig_clean, 8001));
% vec = vec(1:end/2 +1);
% plot([0:1:4000],vec); %FIX by increasing DFT bins
% plot(F_actual, abs(H));

[coeff, gain, pitch] = mylpvocod_ana(speech_mat,12);
sig = mylpvocod_syn(coeff, gain, pitch);
soundsc(sig, 8000)
% plot(pitch);
% filt = fir1(50, 500/8000);
% % freqz(filt)
% sig_filt = fftfilt(filt, sig_clean);
% % pitch = mypitch(sig_filt, 0.75, 0.15)
% bank = myfilterbank(10, 150);
% hold all
% dumb = filt1;
% for i = 2:10
%     %plot plot plot
%     dumb = dumb + bank(:,i);
% end
% freqz(dumb);
% hold all
% plot(time_clean, sig_clean)
% plot(sig_filt)
% plot(sig_clean)
% plot(lag, sig_corr)