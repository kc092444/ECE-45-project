function y = SqrWaveGen(amp)

y = @(t) amp * sign(sin(t));

end

% written by Kamran Mapar
% Square wave equation: https://en.wikipedia.org/wiki/Square_wave
% Sgn function in MATLAB: https://www.mathworks.com/help/matlab/ref/sign.html
