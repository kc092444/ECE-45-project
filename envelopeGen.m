function envMatrix = envelopeGen(attack_length, decay_length, sustain, release_length, note_length)

% Script created by Natalie Sigurdson, edited by Ruilin Hu

attack_length = attack_length*note_length;
decay_length = decay_length*note_length;
release_length = release_length*note_length;

sustain_length = note_length - attack_length - release_length- decay_length;

attack_target = 1;
decay_target = attack_target*sustain;
decay_end = attack_length + decay_length;
sustain_end = sustain_length + decay_end;



f1 = @(x) (attack_target/attack_length)*x;
f2 = @(x) ((decay_target - attack_target)/decay_length)*x - ((attack_length*(decay_target - attack_target))/decay_length) + attack_target; 
f3 = @(x) decay_target;
f4 = @(x) (-decay_target/release_length)*x - (-decay_target/release_length)*sustain_end + decay_target;

% syms x
% y = piecewise(0<x<attack_length, f1, attack_length<x<decay_end, f2, decay_end<x<sustain_end, f3, sustain_end<x<note_length, f4);
% this is for testing:
% fplot(y, [0,note_length])

% edits: removed symbolic calculations and replaced with a discrete matrix
% for faster processing on computers.
% Edited by Ruilin Hu
envMatrix = zeros(note_length,1); 
for i = 1:note_length
    result = 0;
    if (i > 0) && (i < attack_length)
        result = f1(i);
    else if (i <= attack_length) && (i < decay_end)
        result = f2(i);
    else if (i <= decay_end) && (i < sustain_end)
        result = f3(i);
    else
        result = f4(i);
    end
end
    
    envMatrix(i, 1) = result;
end

end


