function [max_min, average, max_env] = get_envelope( psd, f, window_min, window_max )
    hz_diff = 0.1;
    env_diff = 3;
    vec1_start = f > window_min;
    vec1_end = f < window_max;
    vec_1 = logical(vec1_start .* vec1_end);
    psd_window = psd(vec_1);
    len_coeffs = round((window_max-window_min)/hz_diff);
    coeffs = ones(1, len_coeffs)/len_coeffs;
    avg_plt = filter(coeffs, 1, psd_window);
    max_min = abs(max(avg_plt)-min(avg_plt));
    average = mean(avg_plt);
    [envHigh, envLow] = envelope(psd_window,env_diff,'peak');
    max_env = abs(max(envHigh-envLow));
end

