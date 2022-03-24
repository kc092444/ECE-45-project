% This file outputs an array of the band pass filter to plot. 
% This file is authored by Zhizhen (Averi) Yu and co-commented by HaoZhang Chu. 

% Len = the length of input_wav
% High_cut = the higher boundary frequency for a Band Pass Filt
% er.
% Low_cut = the lower boundary frequency for a Band Pass Filter

% Function Description:
% This plotBandPassFilter function output the frequency response
% amplitude based on the given parameters.

function output = plotBandPassFilter(Len, High_cut, Low_cut)

    Fs = 10400; %Sampling frequency by default

%Len = 10000;
%Low_cut = 500;
%High_cut = 2000;

    f = (1:Len)*(Fs/Len);

    output = zeros([Len 1]);

    for i = 1:Len
        if(f(i) > Low_cut && f(i) < High_cut)
            output(i) = 1;
        else
            output(i) = 0;
        end
    end

%plot(f, output)
end
