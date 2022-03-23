s = @(t) 0.955*sin(t) + 0.02*sawtooth(t, 1/2) + 0.025*square(t);
matrix = zeros(10000, 1);
for i=1:10000
    matrix(i, 1) = s(i);
end
e = @(t) 1-0.00000001*(t*t); % don't worry about envelope for instruments
tr = @(t) 1; % don't worry about tremolo for instruments
% Test using the statement above for middle C
makeFileSound(matrix, e, tr, 1, 0, 0, 0, 100, 10000);