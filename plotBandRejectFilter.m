% plotBandRejectFilter(Len, High_cut, Low_cut)

% Len = the length of input_wav
% High_cut = the higher boundary frequency for a Band Reject Fi
% lter.
% Low_cut = the lower boundary frequency for a Band Reject Filt
% er.

% Function Description:
% This plotBandRejectFilter function output the frequency respo
% nse amplitude based on the given parameters.


function output = plotBandRejectFilter(Len, High_cut, Low_cut)

    Fs = 10400; %Sampling frequency by default

%Len = 10000;
%Low_cut = 1000;
%High_cut = 2000;

    f = (1:Len)*(Fs/Len);

    output = zeros([Len 1]);

    for i = 1:Len
        if(f(i) < Low_cut)
            output(i) = 1;
        elseif(f(i) > High_cut)
            output(i) = 1;
        else
            output(i) = 0;
        end
    end

%plot(f, output);

end