function y = SqrWaveGen(amp, freq)

sqr_w = 2*pi*freq; % Square wave frequency 
t = 0:10000;
duty = 50;  % Square wave is on and off for equal amt of time

y = amp * square(2*pi*sqr_w*t, duty);

end

% written by Kamran Mapar