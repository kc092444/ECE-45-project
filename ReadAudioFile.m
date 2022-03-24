function [AudioValues, FsOut] = ReadAudioFile(FileDestination, NoteLength)
%READAUDIOFILE reads the 
%   Detailed explanation goes here
clear y Fs
info = audioinfo(FileDestination);
[y,Fs] = audioread(FileDestination);
 
if(NoteLength > length(y))
    [rowsize,colsize] = size(y);
    ZeroMatrix = zeros(NoteLength, colsize);
    ZeroMatrix(1:rowsize, 1:colsize)=y; 
    y = ZeroMatrix;
    audiowrite('AudioWithCorrectedFreq.wav',y,10400);
    
else
    audiowrite('AudioWithCorrectedFreq.wav',y,10400);
end


info = audioinfo('AudioWithCorrectedFreq.wav');
[y,Fs] = audioread('AudioWithCorrectedFreq.wav');
x = y(:,1);
AudioValues = x;
%sound(x,Fs);

t = 0:seconds(1/Fs):seconds(info.Duration);
t = t(1:end-1);
%plot(t,x)
%xlabel('Time')
%ylabel('Audio Signal')

FsOut = Fs;
end

