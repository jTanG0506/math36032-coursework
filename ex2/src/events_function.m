function [value, isTerminal, direction] = events_function(t, z, distance)
  value(1) = z(1) - distance;
  isTerminal(1) = 0;
  direction(1) = 1;
  
  value(2) = z(2);
  isTerminal(2) = 1;
  direction(2) = -1;
end