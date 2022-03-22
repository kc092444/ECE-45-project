function y = SinWaveGen(amp, freq)

w = 2*pi*freq; 
t = 0:10000;

y = amp * sin(w * t);

end

% written by Kamran Mapar

