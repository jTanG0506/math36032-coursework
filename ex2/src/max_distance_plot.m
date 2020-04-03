g = 9.8;        % Standard gravity (ms^-2)
v = 450;        % Initial velocity (ms^-1)
m = 6;          % Weight of ball (kg)
K = 2e-5;       % Drag constant (kgm^-1)

distance_fun = @(theta) -distance_function(g, v, m, K, theta);
[thetaMax, distance] = fminbnd(distance_fun, eps, pi / 2);
[t0, z0] = projection_solution(g, v, m, K, thetaMax, 0);
[t1, z1] = projection_solution(g, v, m, 0, pi / 4, 0);

plot(z0(:, 1), z0(:, 2), z1(:, 1), z1(:, 2));
xlabel('Horizontal Displacement (m)');
ylabel('Vertical Displacement (m)');

xlim([0, 1.05 * z1(end, 1)]);
ylim([0, 1.05 * max(max(z0(:, 2)), max(z1(:, 2)))]);
legend('K = 0.00002', 'K = 0');
