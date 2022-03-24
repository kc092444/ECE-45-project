% plotHighPassFilter(Len, High_cut)

% Len = the length of input_wav
% High_cut = the frequency below the High_cut will be cut, whil
% e frequency above will be kept.

% Function Description:
% This plotHighPassFilter function output the frequency respons
% e amplitude based on the given parameters.

function output = plotHighPassFilter(Len, High_cut)
    Fs = 10400; %Sampling frequency by default

%Len = 1000;
%High_cut = 500; 

    f = (1:Len)*(Fs/Len);

    output = zeros([Len 1]);

    for i = 1:Len
        if(f(i) > High_cut)
            output(i) = 1;
        else
            output(i) = 0;
        end
    end

%plot(f, output);

end