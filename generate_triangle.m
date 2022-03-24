function y = generate_triangle(amp)
%generate_sawtooth: returns a function of triangle wave

    % period of the triangle waveform
    period = 2 * pi;
    
    % equation of the triangle waveform
    y = amp * abs(mod(t - 1, period) - (period / 2)) - amp;

end

% written by Yiyang Chen
% absolute value symbol : https://www.mathworks.com/help/matlab/ref/abs.html
