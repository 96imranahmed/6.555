fib_1 = load('data/n_422.mat');
fib_1 = fib_1.n_422;
fib_2 = load('data/n_424.mat');
fib_2 = fib_2.n_424;
time_1 = [0:1/250:length(fib_1)/250]';
time_1 = time_1(1:end-1);
time_2 = [0:1/250:length(fib_2)/250]';
time_2 = time_2(1:end-1);

plot(time_1, fib_1)

% vec1_start = time_1 > 0;
% vec1_end = time_1 < 10;
% vec_1 = logical(vec1_start .* vec1_end);
% fib_1_ecg_normal = fib_1(vec_1);
% fib_1_time_normal = time_1(vec_1);
% 
% vec1_start = time_1 > 90;
% vec1_end = time_1 < 100;
% vec_1 = logical(vec1_start .* vec1_end);
% fib_1_ecg_arr = fib_1(vec_1);
% fib_1_time_arr = time_1(vec_1);
% 
% 
% vec1_start = time_1 > 270;
% vec1_end = time_1 < 280;
% vec_1 = logical(vec1_start .* vec1_end);
% fib_1_ecg_arr_2 = fib_1(vec_1);
% fib_1_time_arr_2 = time_1(vec_1);
% 
% [normal_psd, f] = pwelch(fib_1_ecg_normal, [], [], [],250);
% [arr_psd, f] = pwelch(fib_1_ecg_arr, [], [], [],250);
% [arr_2_psd, f] = pwelch(fib_1_ecg_arr_2, [], [], [],250);
% 
% hold all
% plot(f,pow2db(normal_psd));
% plot(f,pow2db(arr_psd));
% plot(f, pow2db(arr_2_psd));
% 
% plot(fib_1_time_normal, fib_1_ecg_normal);
% plot(fib_1_time_arr, fib_1_ecg_arr);