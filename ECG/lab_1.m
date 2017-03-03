patient = load('data/n_424.mat');
patient = patient.n_424;
[alarm, T] = va_detect(patient, 250);
% plot(T,alarm);
err = compare_to_expert(424);
disp(err)
