% Written by Kamran Mapar
% Overtones adjusted to replicate a flute frequency
% makeSaxSound takes envelope, volume, and inputted waveform 
% Multiplies said inputs, and outputs a waveform to sound like a flute

function makeFluteSound(waveform, envelope, tremolo, noteFrequency, lowPass, highPass, reject, volume, length)

% s = @(t) 0.955*sin(t) + 0.02*sawtooth(t, 1/2) + 0.025*square(t);
% Change the waveform above to change how instrument "sounds"
Sinemix = SinWaveGen(0.955);
Squaremix = SqrWaveGen(0.025);
Trianglemix = generate_triangle(0.02);
% Sawmix = generate_sawtooth(0.9);
outputWave = @(t) Sinemix(t) + Squaremix(t) + Trianglemix(t); % + Sawmix(t);

outputWaveFund = @(t)  outputWave(t*noteFrequency/(2*pi));
outputWaveFinal = @(t) 0.001*outputWaveFund(t*2);
outputWaveFinal = @(t) 0.0015*outputWaveFund(t*3) + outputWaveFinal(t);
outputWaveFinal = @(t) 0.25*outputWaveFund(t*4) + outputWaveFinal(t);
% outputWaveFinal = @(t) 0.09*outputWaveFund(t*5) + outputWaveFinal(t);

outputWaveFinal = @(t) 0.03*outputWaveFund(t) + outputWaveFinal(t);

soundMatrix = zeros(length,1); 

for i = 1:length
    soundMatrix(i, 1) = outputWaveFinal(i);
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


for i = 1:length 
    result = finalSoundMatrix(i, 1) * envelope(i); %, 1);
    result = result * tremolo(i);
    result = result*volume/100;
    finalSoundMatrix(i, 1) = result;
end
sound(finalSoundMatrix, 10400);
end
