function output = plotBandPassFilter(Len, High_cut, Low_cut)

    Fs = 10400; %Sampling frequency by default
    f_shift = (-Len/2 : Len/2 - 1)*(Fs/Len);
    
    output = zeros([Len 1]);

    for i = 1:Len
        if(abs(f_shift(i)) > Low_cut && abs(f_shift(i)) < High_cut)
            output(i) = 1;
        else
            output(i) = 0;
        end
    end
end