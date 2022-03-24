%This file is co-authored by Zhizhen (Averi) Yu and Ruilin Hu
% s = @(t) 0.955*sin(t) + 0.02*sawtooth(t, 1/2) + 0.025*square(t);
a = @(t) 1;
e = @(t) 1; %-0.00000001*(t*t); % don't worry about envelope for instruments
tr = @(t) 1; % don't worry about tremolo for instruments
% Test using the statement above for middle C
makeElectricGuitarSound(a, e, tr, 1, 0, 0, 1, 100, 10000);