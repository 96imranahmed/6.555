close all
folder = fileparts(which('ch_voc.m')); 
addpath(genpath(folder));

speech_mat = load('vocod/data/cw161_8k.mat');
speech_mat = speech_mat.cw161;
% soundsc(speech_mat, 8000)
% time = 0:1/8000:length(speech_mat)/8000;
% time = time(1:end-1)';

% vec1 = time > 0.76;
% vec2 = time < 0.86;
% vec = logical(vec1 .* vec2);
% time_clean = time(vec);
% sig_clean = speech_mat(vec);
[band_envelopes,pitch] = mychvocod_ana(speech_mat,75,18);
speech = chvocod_syn(band_envelopes,pitch,100);
% soundsc(speech, 8000)
if max(speech) > 1
    speech = speech./max(speech);
end
if min(speech) < -1
    speech = speech./min(speech);
end
audiowrite('dec_75_ch_vocod_out.wav', speech, 8000)
% filt = fir1(50, 500/8000);
% % freqz(filt)
% sig_filt = fftfilt(filt, sig_clean);
% pitch = mypitch(sig_filt, 0.75, 0.15)
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