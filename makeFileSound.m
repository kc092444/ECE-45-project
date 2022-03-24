function makeFileSound(fileSoundMatrix, envelope, tremolo, frequency, lowPass, highPass, reject, volume, length)
% makeSound(waveform, envelope, frequency, volume, length) by Ruilin Hu
% func waveform = generated waveform from sine, tri, saw, and sqaure
% func envelop = ADSR envelope, now in matrix
% int frequency = determined by Octave value & keys pressed
% int volume = volume slider value
% int length = how long the note should be played
% When a key on the keyboard is pressed, this function multiplies
% the generated waveform with envelope and then volume (amplitude)
% to find the output waveform. It then plays this sound at the set
% frequency corresponding to the key and octave.
% reference: https://www.mathworks.com/matlabcentral/answers/336146-merging-multiplying-functions
% reference: https://www.mathworks.com/help/signal/ref/sawtooth.html

% test code below, remove when finished
% waveform = @(t) sin(t);
% waveform = @(t) sawtooth(t);
% envelope = @(t) 1;
% volume  = 20;
% frequency = 1; %D4 change to 1.1
% length = 10000;
% test code above, remove when finished

% outputWaveFinal = @(t) outputWave(t*frequency/(2*pi));

x = fileSoundMatrix;
fileSoundMatrix = resample(x,10400,round(frequency/(2*pi)*10400));
[nLength, ~] = size(fileSoundMatrix);

% implement below after filters are done
if lowPass ~= 0 && highPass == 0
    lowPassingFrequency = (100 - lowPass)*(2793.83 - 16.35)/100 + 16;
    finalSoundMatrix = LowPassFilter(fileSoundMatrix, nLength, nLength * 10, lowPassingFrequency);
elseif lowPass == 0 && highPass ~= 0
    highPassingFrequency = (highPass)*(2793.83 - 16.35)/100 + 16;
    finalSoundMatrix = HighPassFilter(fileSoundMatrix, nLength, nLength * 10,  highPassingFrequency);
elseif lowPass ~= 0 && highPass ~= 0 && reject == 0
    lowPassingFrequency = (100 - lowPass)*(2793.83 - 16.35)/100 + 16;
    highPassingFrequency = (highPass)*(2793.83 - 16.35)/100 + 16;
    finalSoundMatrix = BandPassFilter(fileSoundMatrix, nLength, nLength * 10, highPassingFrequency, lowPassingFrequency);
elseif lowPass ~= 0 && highPass ~= 0 && reject ~= 0
    lowPassingFrequency = (100 - lowPass)*(2793.83 - 16.35)/100 + 16;
    highPassingFrequency = (highPass)*(2793.83 - 16.35)/100 + 16;
    finalSoundMatrix = BandRejectFilter(fileSoundMatrix, nLength, nLength * 10, highPassingFrequency, lowPassingFrequency);
else
    finalSoundMatrix = fileSoundMatrix;
end

outputSoundMatrix = zeros(length, 1);

% implement above after filters are done
for i = 1:length %interate from leftmost column to right, middle number is step size
    if i > length
        break;
    end
    envelopeValue = envelope(i);
    result = finalSoundMatrix(i, 1) * envelopeValue;
    result = result * tremolo(i);
    result = result*volume/100;
    outputsoundMatrix(i, 1) = result;
end

sound(outputsoundMatrix, 20800);
end