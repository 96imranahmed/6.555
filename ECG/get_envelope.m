function [max_min, average] = get_envelope( psd, f, window_min, window_max )
    vec1_start = f > window_min;
    vec1_end = f < window_max;
    vec_1 = logical(vec1_start .* vec1_end);
    psd_window = psd(vec_1);
    max_min = abs(max(psd_window)-min(psd_window));
    average = mean(psd_window);
end

