function S = logreg(a, h, p)
  S = 0;
  for k = 1 : length(h)
    S = S + (p(k) - 1 / (1 + exp(-a(1) * h(k) - a(2))))^2;
  end
end
