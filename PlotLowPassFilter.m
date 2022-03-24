% PlotLowPassFilter(Len, Low_cut) by Haozhang Chu

% Len = the length of input_wav
% Low_cut = the frequency below the Low_cut will be kept, while
% frequency above will be filtered out.

% Function Description:
% This PlotLowPassFilter function output the frequency response
% amplitude based on the given parameters.

function freq_response = PlotLowPassFilter(Len, Low_cut)

    Fs = 10400; % Default sampling frequency

%Len = 10000;
%Low_cut = 500;

    f = (1:Len)*(Fs/Len);

    freq_response = zeros([Len 1]);

    for i = 1:Len
        if(f(i) < Low_cut)
            freq_response(i) = 1;
        else
            freq_response(i) = 0;
        end
    end

%plot(f, freq_response);
end