% This file creates tremolo effect on the sound file. It generates a
% a mathematical function for the tremolo effect for sounds. 
% Author: Zhizhen (Averi) Yu.
%
% Reference: 
% https://christianfloisand.wordpress.com/2012/04/18/coding-some-tremolo/
function tremFunc = tremoloGen(depth_percent, tempo_percent)
% A tremolo is a type of low frequency oscillator (LFO) 
% that rhythmatically modifies the volume of the guitar. 
%
% Parameters: 
%   depth_percent - the percent value for the depth of the tremolo
%   tempo_percent - the percent value for the tempo of the tremolo

sampleRate = 10400; %by default
w = 2 * pi / sampleRate;
depth = depth_percent *0.5; 

Modification = @(t) (1 - depth) + depth * (sin(w * t * tempo_percent*10));
% depth — the amount of modulation the LFO will apply on to 
% the original signal.
% tempo - Frequency modification. 
% A cap of 10 Hz works well for tremolo by reference.

% outputWave = @(x) outputWave(x) * Modification;

tremFunc = Modification;
