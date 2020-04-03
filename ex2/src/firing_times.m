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
      
d1 = delay_function(te1(1), ze1(1, 2));
d2 = delay_function(te2(1), ze2(1, 2));
      
fprintf('[theta = %.4f]: Min Delay = %.4f, Max Delay = %.4f\n', ...
        thetaOne, d1(1), d1(2));
fprintf('[theta = %.4f]: Min Delay = %.4f, Max Delay = %.4f\n', ...
        thetaTwo, d2(1), d2(2));