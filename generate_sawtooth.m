function y = generate_sawtooth(amp)
% generate_sawtooth: returns a function of sampled sawtooth wave


   % period of the wave
     period = 2 * pi; 
    
   % equation of sawtooth function
    y = @(t) -(2 * amp / pi) * atan(cot(pi * t / period));

end
% written by Yiyang Chen 
% sawtooth wave equation : https://en.wikipedia.org/wiki/Sawtooth_wave
% arctan symbol : https://www.mathworks.com/help/matlab/ref/atan.html
% cot symbol : https://www.mathworks.com/help/matlab/ref/cot.html
    
   
