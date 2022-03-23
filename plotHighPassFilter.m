function freq_response = plotHighPassFilter(Len, High_cut)
    freq_response = zeros([Len 1]);

    for i = 1:Len
        if(f_shift(i) > High_cut || f_shift(i) < -High_cut)
            output(i) = 1;
        else
            output(i) = 0;
        end
    end
end