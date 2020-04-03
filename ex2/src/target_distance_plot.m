g = 9.8;      % Standard gravity (ms^-2)
v = 450;      % Initial velocity (ms^-1)
m = 6;        % Weight of ball (kg)
K = 2e-5;     % Drag constant (kgm^-1)

target_distance = 15000;
distance_fun = @(t) distance_function(g, v, m, K, t);
[maxTheta, ~] = fminbnd(@(theta) -distance_fun(theta), 0, pi / 2);

distance_from_target = @(theta) distance_fun(theta) - target_distance;
thetaOne = fzero(distance_from_target, [eps, maxTheta]);
thetaTwo = fzero(distance_from_target, [maxTheta, pi / 2]);

ic_distance = 12000;
[t1, z1, te1, ze1] = projection_solution(g, v, m, K, thetaOne, ic_distance);
[t2, z2, te2, ze2] = projection_solution(g, v, m, K, thetaTwo, ic_distance);

plot(z1(:, 1), z1(:, 2), z2(:, 1), z2(:, 2));
xlabel('Horizontal Displacement (m)');
ylabel('Vertical Displacement (m)');

xlim([0, target_distance]);
ylim([0, 1.05 * max(max(z1(:, 2)), max(z2(:, 2)))]);
legend('\theta_1', '\theta_2');