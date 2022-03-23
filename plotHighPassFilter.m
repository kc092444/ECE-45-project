function output = plotHighPassFilter(Len, High_cut)
    output = zeros([Len 1]);

    Fs = 10400; %Sampling frequency by default
    f_shift = (-Len/2 : Len/2 - 1)*(Fs/Len);

    for i = 1:Len
        if(f_shift(i) > High_cut || f_shift(i) < -High_cut)
            output(i) = 1;
        else
            output(i) = 0;
        end
    end
end