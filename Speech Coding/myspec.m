close all
folder = fileparts(which('ch_voc.m')); 
addpath(genpath(folder));

speech_mat = load('vocod/data/cw161_8k.mat');
speech_mat_diffed = diff(speech_mat.cw161);
speech_mat = speech_mat.cw161;


[band_envelopes,pitch] = mychvocod_ana(speech_mat,100,18);
sig_ch = diff(chvocod_syn(band_envelopes,pitch,100));


[coeff, gain, pitch] = mylpvocod_ana(speech_mat,12);
sig_lp = diff(mylpvocod_syn(coeff, gain, pitch));

specgram6555(speech_mat,107, 0, 2048, 8000);
figure; specgram6555(sig_ch,107, 0, 2048, 8000);
figure; specgram6555(sig_lp,107,0, 2048,  8000);