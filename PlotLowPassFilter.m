function freq_response = PlotLowPassFilter(Len, Low_cut)
    freq_response = zeros([Len 1]);

    for i = 1:Len
        if(f_shift(i) > -cut_freq && f_shift(i) < cut_freq)
            freq_response(i) = 1;
        else
            freq_response(i) = 0;
        end
    end
end