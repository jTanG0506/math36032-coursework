function [t, z, te, ze] = projection_solution(g, v, m, K, theta, distance)
  ode = @(t, z) projection_ode(t, z, g, m, K);
  tspan = [0, 2 * v / g];
  ic = [0, 0, v * cos(theta), v * sin(theta)];
  events_fun = @(t, z) events_function(t, z, distance);
  options = odeset('events', events_fun, 'reltol', 1e-8);
  [t, z, te, ze] = ode45(ode, tspan, ic, options);
end
