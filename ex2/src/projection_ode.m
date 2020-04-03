function s = projection_ode(t, z, g, m, K)
  s = zeros(4, 1);
  s(1) = z(3);
  s(2) = z(4);
  s(3) = -K * sqrt(z(3)^2 + z(4)^2) * z(3) / m;
  s(4) = -g - K * sqrt(z(3)^2 + z(4)^2) * z(4) / m;
end
