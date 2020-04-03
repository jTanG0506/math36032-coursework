g = 9.8;      % Standard gravity (ms^-2)
v = 450;      % Initial velocity (ms^-1)
m = 6;        % Weight of ball (kg)
K = 2e-5;     % Drag constant (kgm^-1)

distance_fun = @(theta) -distance_function(g, v, m, K, theta);
[theta, distance] = fminbnd(distance_fun, eps, pi / 2);
fprintf('Firing at %.6f radians yields a maximum distance of %.2fm\n', ...
        theta, -distance);
      