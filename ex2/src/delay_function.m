function d = delay_function(t, h)
  n = ceil(0.05 * (t - 0.01 * h));
  td = 0.01 * h + 20 * n - t;
  d = [max(td - 10, 0), td];
end
