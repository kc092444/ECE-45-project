function makePianoSound(waveform, envelope, tremolo, noteFrequency, lowPass, highPass, volume, length)
% makePianoSound by Ruilin Hu

% func waveform = generated waveform from sine, tri, saw, and sqaure
% matrix envelop = ADSR envelope
% func tremolo = tremolo function generated from sliders
% int noteFrequency = determined by Octave value & keys pressed
% int lowPass = highest frequency allowed in sound
% int highPass = lowest frequency allowed in sound
% int volume = volume slider value
% int length = how long the note should be played
% When a key on the keyboard is pressed, this function multiplies
% the generated waveform with envelope and then volume (amplitude)
% to find the output waveform. Then it mimics a piano Frequency 
% Response to generate resultant waveforms of the output.
% It then plays this sound.
% reference: https://www.mathworks.com/matlabcentral/answers/336146-merging-multiplying-functions
% reference: https://www.mathworks.com/help/signal/ref/sawtooth.html

s = @(t) 0.955*sin(t) + 0.02*sawtooth(t, 1/2) + 0.025*square(t);
% Change the waveform above to change how instrument "sounds"
outputWave = s; %outputWave = waveform * envelope

outputWaveFund = @(t)  outputWave(t*noteFrequency/(2*pi));
outputWaveFinal = @(t) 0.15*outputWaveFund(t*2);
outputWaveFinal = @(t) 0.1*outputWaveFund(t*3) + outputWaveFinal(t);
outputWaveFinal = @(t) 0.05*outputWaveFund(t*4) + outputWaveFinal(t);
% outputWaveFinal = @(t) 0.09*outputWaveFund(t*5) + outputWaveFinal(t);
% feel free to add more
outputWaveFinal = @(t) 0.7*outputWaveFund(t) + outputWaveFinal(t);

soundMatrix = zeros(length,1); %soundMatrix is lengthx1 matrix with all zeroes

for i = 1:length
    soundMatrix(i, 1) = outputWaveFinal(i);
end

% finalSoundMatrix = LowPassFilter(soundMatrix, length, 10400, lowPass);
finalSoundMatrix = soundMatrix;

for i = 1:length %interate from leftmost column to right, middle number is step size
    result = finalSoundMatrix(i, 1) * envelope(i); %, 1);
    result = result * tremolo(i);
    result = result*volume/100;
    finalsoundMatrix(i, 1) = result;
end
sound(finalsoundMatrix, 10400);
end