% BandRejectFilter(input_wav, Len, Fs, Low_cut, High_cut) by Haozhang Chu

% input_wav = an n x 1 matrix containing the waveform
% Len = the length of input_wav
% Fs = sampling frequency (our default is 10400)
% Low_cut = threshold frequency for which the frequency below it will
% be kept.
% High_cut = threshold frequency for which the frequency above it wil
% l be kept.

% Function Description:
% This BandRejectFilter takes a input_wav with its length. The sampli
% ng frequency, Low_cut frequency, and High_cut frequency. The freque
% ncy below the Low_cut frequency in the input_wave will be kept, whi
% le the frequency above the High_cut frequency will be kept. The fre
% quency between the Low_cut and High_cut frequency will be filtered 
% out by this function.

function output_wav = BandRejectFilter(input_wav, Len, Fs, Low_cut, High_cut)
    out_trans = fft(input_wav);
    f_trans = (0:Len-1)*(Fs/Len);

    out_shift = fftshift(out_trans);
    f_shift = (-Len/2 : Len/2 - 1)*(Fs/Len);

    output = zeros([Len 1]);

    for i = 1:Len
        if(abs(f_shift(i)) < Low_cut)
            output(i) = 1;
        elseif(abs(f_shift(i)) > High_cut)
            output(i) = 1;
        else
            output(i) = 0;
        end
    end

    filtered_freq = output.*out_shift;

    out_shift2 = fftshift(filtered_freq);
    f_shift2 = (0:Len-1)*(Fs/Len);

    output_wav = ifft(out_shift2);
    
end