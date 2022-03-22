function x = volume_control(volume)
% volume_control: returns a function of the volume

  % The equation of the final volume
  % Because the final volume is equal to the amplitude
  % times the ratio of the slider, which is from 0 to 100
  x = amp * (volume / 100);

end
% written by Yiyang Chen