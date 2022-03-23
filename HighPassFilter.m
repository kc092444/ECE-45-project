% HighPassFilter(input_wav, Len, Fs, cut_freq) by Haozhang Chu

% input_wav = an n x 1 matrix containing the waveform
% Len = the length of input_wav
% Fs = sampling frequency (our default is 10400)
% cut_freq = the frequency above the cut_freq will be kepted by this
% HighPassFilter, while the frequency below will be filtered out.

% Function Description:
% This HighPassFilter takes a input_wav with its length. The sampling
% frequency and the cut_frequency. The frequency above the cut_freque
% ncy in the input_wave will be kept, while the frequency below the c
% ut_frequency will be filtered out by this function.

function output_wav = HighPassFilter(input_wav, Len, Fs, cut_freq)
    out_trans = fft(input_wav);
    f_trans = (0:Len-1)*(Fs/Len);

    out_shift = fftshift(out_trans);
    f_shift = (-Len/2 : Len/2 - 1)*(Fs/Len);

    output = zeros([Len 1]);

    for i = 1:Len
        if(f_shift(i) > cut_freq || f_shift(i) < -cut_freq)
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