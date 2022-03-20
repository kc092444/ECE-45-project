s = @(t) 0.955*sin(t) + 0.02*sawtooth(t, 1/2) + 0.025*square(t);
e = @(t) 1-0.00000001*(t*t);
makePianoSound(s, e, 1, 50, 10000);