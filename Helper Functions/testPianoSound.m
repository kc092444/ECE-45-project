s = @(t) 0.955*sin(t) + 0.02*sawtooth(t, 1/2) + 0.025*square(t);
e = @(t) 1-0.00000001*(t*t);
tr = @(t) 1;
makePianoSound(s, e, tr, 1, -1, 10000, 50, 10000);