function [alarm,t] = va_detect(ecg_data,Fs)
%VA_DETECT  ventricular arrhythmia detection skeleton function
%  [ALARM,T] = VA_DETECT(ECG_DATA,FS) is a skeleton function for ventricular
%  arrhythmia detection, designed to help you get started in implementing your
%  arrhythmia detector.
%
%  This code automatically sets up fixed length data frames, stepping through 
%  the entire ECG waveform with 50% overlap of consecutive frames. You can customize 
%  the frame length  by adjusting the internal 'frame_sec' variable and the overlap by
%  adjusting the 'overlap' variable.
%
%  ECG_DATA is a vector containing the ecg signal, and FS is the sampling rate
%  of ECG_DATA in Hz. The output ALARM is a vector of ones and zeros
%  corresponding to the time frames for which the alarm is active (1) 
%  and inactive (0). T is a vector the same length as ALARM which contains the 
%  time markers which correspond to the end of each analyzed time segment. If Fs 
%  is not entered, the default value of 250 Hz is used. 
%
%  Template Last Modified: 3/4/06 by Eric Weiss, 1/25/07 by Julie Greenberg


%  Processing frames: adjust frame length & overlap here
%------------------------------------------------------
frame_sec = 5; % sec
overlap = 0.0;  % 50% overlap between consecutive frames


% Input argument checking
%------------------------
if nargin < 2
    Fs = 250;   % default sample rate
end;
if nargin < 1
    error('You must enter an ECG data vector.');
end;
ecg_data = ecg_data(:);  % Make sure that ecg_data is a column vector
 

% Initialize Variables
%---------------------
frame_length = round(frame_sec*Fs);  % length of each data frame (samples)
frame_step = round(frame_length*(1-overlap));  % amount to advance for next data frame
ecg_length = length(ecg_data);  % length of input vector
frame_N = floor((ecg_length-(frame_length-frame_step))/frame_step); % total number of frames
alarm = zeros(frame_N,1);	% initialize output signal to all zeros
max_min_lst = zeros(frame_N,1);
average_lst = zeros(frame_N,1);
t = ([0:frame_N-1]*frame_step+frame_length)/Fs;

% Analysis loop: each iteration processes one frame of data
%----------------------------------------------------------
count = 0;
hold on
for i = 1:frame_N
    %  Get the next data segment
    seg = ecg_data(((i-1)*frame_step+1):((i-1)*frame_step+frame_length));
%     filter_coeffs = fir1(100,[1/250 10/250],hann(101)); % Attila the Hann
%     filt_signal = filter(filter_coeffs,1,seg); %filtering is not helping?
    filt_signal = seg;
    [clean_filt_psd, f] = pwelch(filt_signal, [], [], [],250);
    [max_min_lst(i), average_lst(i)] = get_envelope(clean_filt_psd, f, 3.5, 6.5);
%         alarm(i) = 1
    count = count + 1;
    % define normal segment as chunks in the first 20 seconds - 4 segment
end
% plot(max_min_lst)
% plot(average_lst)
%plot(f,pow2db(clean_filt_psd));
normal_window = 20;
end_slice = round(normal_window/frame_sec);
normal_avg = mean(average_lst(1:end_slice));
normal_max_min = mean(max_min_lst(1:end_slice));
avg_thresh = 1.5;
maxmin_thresh = 1.5;
for i = 1:frame_N
    uppermaxmin = normal_max_min * maxmin_thresh;
    upperavg = normal_avg * avg_thresh;
    if average_lst(i) > upperavg && max_min_lst(i) > uppermaxmin
        alarm(i) = 1;
    end
end




