function parseFreqMultiplier
% function parseFreqMultiplier by Ruilin Hu

% This function does not need to be run! The freqmult.mat file is generated
% once and is always applicable to this application. This is only a helper
% function that helps converting csv of frequencies of notes into a .mat
% file that can be read directly/conveniently by MATLAB.

% This function takes the frequencies of different notes and convert them
% into the desirec multiplier, such frequency_of_note = multiplier *
% fruency_of_Middle_C. The output is a .mat file saved on the disk that 
% can be used as inputs for frequencyTable of the .mlapp file.
% reference: https://www.mathworks.com/help/matlab/ref/readtable.html

FreqMultis = readtable('frequency_multipliers.csv');
save('freqmult.mat', 'FreqMultis');