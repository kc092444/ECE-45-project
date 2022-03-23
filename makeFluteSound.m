function makeFluteSound(waveform, envelope, tremolo, noteFrequency, lowPass, highPass, volume, length)

s = @(t) 0.955*sin(t) + 0.02*sawtooth(t, 1/2) + 0.025*square(t);
% Change the waveform above to change how instrument "sounds"
outputWave = s; %outputWave = waveform * envelope

outputWaveFund = @(t)  outputWave(t*noteFrequency/(2*pi));
outputWaveFinal = @(t) 0.001*outputWaveFund(t*2);
outputWaveFinal = @(t) 0.0015*outputWaveFund(t*3) + outputWaveFinal(t);
outputWaveFinal = @(t) 0.4*outputWaveFund(t*4) + outputWaveFinal(t);
% outputWaveFinal = @(t) 0.09*outputWaveFund(t*5) + outputWaveFinal(t);
% feel free to add more
outputWaveFinal = @(t) 0.03*outputWaveFund(t) + outputWaveFinal(t);

soundMatrix = zeros(length,1); %soundMatrix is lengthx1 matrix with all zeroes

for i = 1:length
    soundMatrix(i, 1) = outputWaveFinal(i);
end

% implement below after filters are done
if lowPass ~= 0 && highPass ==0
    finalSoundMatrix = LowPassFilter(soundMatrix, length, 10400, lowPass);
elseif lowPass == 0 && highPass ~= 0
    finalSoundMatrix = HighPassFilter(soundMatrix, length, 10400, highPass);
elseif lowPass ~= 0 && highPass ~= 0
    finalSoundMatrix = BandPassFilter(soundMatrix, length, 10400, lowPass, highPass);
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