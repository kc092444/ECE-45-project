function makeSound(waveform, envelope, frequency, volume, length)
% makeSound(waveform, envelope, frequency, volume, length) by Ruilin Hu
% func waveform = generated waveform from sine, tri, saw, and sqaure
% func envelop = ADSR envelope
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

outputWave = @(t) waveform(t).*envelope(t); %outputWave = waveform * envelope
outputWaveFinal = @(t) outputWave(t*frequency/(2*pi));
soundMatrix = zeros(length,1); %soundMatrix is 100x100 matrix with all zeroes
for i = 1:length %interate from leftmost column to right, middle number is step size
    result = outputWaveFinal(i);
    result = result*volume/100;
    soundMatrix(i, 1) = result;
end
sound(soundMatrix, 10400);
