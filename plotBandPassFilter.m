function output = plotBandPassFilter(Len, High_cut, Low_cut)

    output = zeros([Len 1]);

    for i = 1:Len
        if(abs(f_shift(i)) > Low_cut && abs(f_shift(i)) < High_cut)
            output(i) = 1;
        else
            output(i) = 0;
        end
    end
end