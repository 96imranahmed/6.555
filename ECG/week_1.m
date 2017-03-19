close all
clean = load('data/normal.mat');
ecg = clean.ecg;
time = clean.t;

vec1 = time > 60;
vec2 = time < 80;
vec = logical(vec1 .* vec2);
ecg_clean = ecg(vec);
time_clean = time(vec);

vec3 = time > 250;
vec4 = time < 270;
vec_noisy = logical(vec3 .* vec4);
ecg_noisy = ecg(vec_noisy);
time_noisy = time(vec_noisy);



[clean_psd, f] = pwelch(ecg_clean, [], [], [],250);
[noisy_psd, f] = pwelch(ecg_noisy, [], [], [],250);
% hold all

% plot(ecg_noisy);
% plot(f, pow2db(clean_psd))
% plot(f, pow2db(noisy_psd))

B = fir1(500,[10/250 60/250], 'bandpass');
% impz(B)
ecg_clean_filt = fftfilt(B, ecg_clean);
ecg_noisy_filt = fftfilt(B, ecg_noisy);
[clean_filt_psd, f] = pwelch(ecg_clean_filt, [], [], [],250);
[noisy_filt_psd, f] = pwelch(ecg_noisy_filt, [], [], [],250);
% % hold all
% plot(f,pow2db(clean_filt_psd));
% plot(f,pow2db(clean_psd));
% plot(ecg_noisy_filt);
% plot(ecg_clean);
hold all
plot(time_noisy, ecg_noisy);
plot(time_noisy, ecg_noisy_filt);
title('Noisy Data: Standard and Filtered Signals');
legend('Normal', 'Filtered')
xlabel('Time (s)')
ylabel('Amplitude')
% plot(f, pow2db(clean_psd));
% plot(f,pow2db(clean_filt_psd));
% title('Clean Data: Standard and Filtered Power Spectrum Density');
% legend('Normal', 'Filtered')
% xlabel('Frequency (Hz)')
% ylabel('Magnitude (dB)')