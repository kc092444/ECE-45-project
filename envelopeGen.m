function envelopeGen(attack_length, decay_length, sustain, release_length, note_length)

attack_length = attack_length*note_length;
decay_length = decay_length*note_length;
release_length = release_length*note_length;

sustain_length = note_length - attack_length - release_length- decay_length;

attack_target = 1;
decay_target = attack_target*sustain;
decay_end = attack_length + decay_length;
sustain_end = sustain_length + decay_end;



f1 = @(t) (attack_target/attack_length)*t;
f2 = @(t) ((decay_target - attack_target)/decay_length)*t - ((attack_length*(decay_target - attack_target))/decay_length) + attack_target; 
f3 = @(t) decay_target;
f4 = @(t) (-decay_target/release_length)*t - (-decay_target/release_length)*sustain_end + decay_target;

syms t
y = piecewise(0<t<attack_length, f1, attack_length<t<decay_end, f2, decay_end<t<sustain_end, f3, sustain_end<t<note_length, f4);

% this is for testing:
% fplot(y, [0,note_length])

