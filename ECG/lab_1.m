close all
patient = load('data/n_424.mat');
patient = patient.n_424;
[alarm, T] = va_detect(patient, 250);
patient = load('data/n_422.mat');
patient = patient.n_422;
[alarm, T] = va_detect(patient, 250);
patient = load('data/n_429.mat');
patient = patient.n_429;
[alarm, T] = va_detect(patient, 250);
patient = load('data/n_430.mat');
patient = patient.n_430;
[alarm, T] = va_detect(patient, 250);
patient = load('data/n_426.mat');
patient = patient.n_426;
[alarm, T] = va_detect(patient, 250);
patient = load('data/n_421.mat');
patient = patient.n_421;
[alarm, T] = va_detect(patient, 250);
patient = load('data/n_423.mat');
patient = patient.n_423;
[alarm, T] = va_detect(patient, 250);
% plot(T,alarm);
err = compare_to_expert(424);
err_4 = compare_to_expert(422);
err_1 = compare_to_expert(426);
err_2 = compare_to_expert(429);
err_3 = compare_to_expert(430);
err_5 = compare_to_expert(421);
err_6 = compare_to_expert(423);
