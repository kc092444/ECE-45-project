% LowPassFilter(input_wav), Len, Fs, cut_freq) by Haozhang Chu

% input_wav = an n x 1 matrix containing the waveform
% Len = the length of input_wav
% Fs = sampling frequency (out default is 10400)
% cut_freq = the frequency below the cut_freq will be kepted by this
% LowPassFilter, while the frequency above will be filtered out.

% Function Description:
% This LowPassFilter takes a input_wav with its length. The sampling
% frequency and the cut_frequency. The frequency below the cut_frequ
% ency in the input_wave will be kept, while the frequency above the
% cut_frequency will be filtered out by this function.


function output_wav = LowPassFilter(input_wav, Len, Fs, cut_freq)

%Fs = 10400;
%t = 0:(1/Fs):(10-1/Fs);
%input_wav = sin(2*pi*16.35*t);
%input_wav = input_wav.';
%Len = length(input_wav);
%cut_freq = 5;

%subplot(2,3,1);
%plot(t,input_wav);

    out_trans = fft(input_wav);
    f_trans = (0:Len-1)*(Fs/Len);

%subplot(2,3,2);
%plot(f_trans, abs(out_trans));

    out_shift = fftshift(out_trans);
    f_shift = (-Len/2 : Len/2 - 1)*(Fs/Len);

%subplot(2,3,3);
%plot(f_shift, abs(out_shift));

    output = zeros([Len 1]);

    for i = 1:Len
        if(f_shift(i) > -cut_freq && f_shift(i) < cut_freq)
            output(i) = 1;
        else
            output(i) = 0;
        end
    end

    filtered_freq = output.*out_shift;

%subplot(2,3,4);
%plot(f_shift, abs(filtered_freq));

    out_shift2 = fftshift(filtered_freq);
    f_shift2 = (0:Len-1)*(Fs/Len);

%subplot(2,3,5);
%plot(f_trans, abs(out_shift2));

    output_wav = ifft(out_shift2);

%subplot(2,3,6);
%plot(t, output_wav);

end