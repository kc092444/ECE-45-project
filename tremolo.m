function tremFunc = tremoloGen(depth, tempo_percent)
% This is a file that creates tremolo effect on the sound file. 

% Creator: Zhizhen (Averi) Yu.

%A tremolo is a type of low frequency oscillator (LFO) 
% that rhythmatically modifies the volume of the guitar. 
%
% Reference: 
% https://christianfloisand.wordpress.com/2012/04/18/coding-some-tremolo/

sampleRate = 10400;
w = 2 * pi / sampleRate;

Modification = @(t) (1 - depth) + depth * (sin(w * t * tempo_percent*10));
%depth — the amount of modulation the LFO will apply on to 
% the original signal — specified in percent.
%A cap of 10 Hz works well for tremolo

% outputWave = @(x) outputWave(x) * Modification;

tremFunc = Modification;
