function makeElectricGuitarSound(waveform, envelope, tremolo, noteFrequency, lowPass, highPass, reject, volume, length)
% This file mimics the sound of electric guitar.

% Author: Zhizhen (Averi) Yu
% The data and tremolo effects in making the electric guitar sound
% are created by Zhizhen (Averi) Yu.

% If you run the test file testElectricGuitarSound, the file particulary 
% generally mimics the sound of electric guitar for rock songs. 

% s = @(t) 0.039*sin(t) + 0.9*sawtooth(t, 1/7) + 0.005*square(t);
Sinemix = SinWaveGen(0.2);
Squaremix = SqrWaveGen(0.3);
Trianglemix = generate_triangle(0.5);
% Sawmix = generate_sawtooth(0.9);
s = @(t) Sinemix(t) + Squaremix(t) + Trianglemix(t); % + Sawmix(t);
% Waveform chan
outputWave = s; %outputWave = waveform * envelope

outputWaveFund = @(t)  outputWave(t*noteFrequency/(2*pi));
outputWaveFinal = @(t) 0.3*outputWaveFund(t*2);
outputWaveFinal = @(t) 0.6*outputWaveFund(t*3) + outputWaveFinal(t);
outputWaveFinal = @(t) 0.1*outputWaveFund(t*4) + outputWaveFinal(t);
% outputWaveFinal = @(t) 0.09*outputWaveFund(t*5) + outputWaveFinal(t);
tremoloMod = tremoloGen(90, 8);
TremoutputWaveFinal = @(t) (0.7*outputWaveFund(t)).*tremoloMod(t);

% The following codes to make sound by Ruilin Hu.
soundMatrix = zeros(length,1); %soundMatrix is lengthx1 matrix with all zeroes

for i = 1:length
    soundMatrix(i, 1) = TremoutputWaveFinal(i);
end

% implement below after filters are done
if lowPass ~= 0 && highPass == 0
    lowPassingFrequency = (100 - lowPass)*(2793.83 - 16.35)/100 + 16;
    finalSoundMatrix = LowPassFilter(soundMatrix, length, 10400, lowPassingFrequency);
elseif lowPass == 0 && highPass ~= 0
    highPassingFrequency = (highPass)*(2793.83 - 16.35)/100 + 16;
    finalSoundMatrix = HighPassFilter(soundMatrix, length, 10400,  highPassingFrequency);
elseif lowPass ~= 0 && highPass ~= 0 && reject == 0
    lowPassingFrequency = (100 - lowPass)*(2793.83 - 16.35)/100 + 16;
    highPassingFrequency = (highPass)*(2793.83 - 16.35)/100 + 16;
    finalSoundMatrix = BandPassFilter(soundMatrix, length, length*10, highPassingFrequency, lowPassingFrequency);
elseif lowPass ~= 0 && highPass ~= 0 && reject ~= 0
    lowPassingFrequency = (100 - lowPass)*(2793.83 - 16.35)/100 + 16;
    highPassingFrequency = (highPass)*(2793.83 - 16.35)/100 + 16;
    finalSoundMatrix = BandRejectFilter(soundMatrix, length, length*10, highPassingFrequency, lowPassingFrequency);
else
    finalSoundMatrix = soundMatrix;
end
% implement above after filters are done

for i = 1:length %interate from leftmost column to right, middle number is step size
    result = finalSoundMatrix(i, 1) * envelope(i); %, 1);
    result = result * tremolo(i);
    result = result*volume/100;
    finalsoundMatrix(i, 1) = result;
end
sound(finalsoundMatrix, 10400);
end