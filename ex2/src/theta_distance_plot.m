g = 9.8;        % Standard gravity (ms^-2)
v = 450;        % Initial velocity (ms^-1)
m = 6;          % Weight of ball (kg)
K = 2e-5;       % Drag constant (kgm^-1)

distance = @(theta) distance_function(g, v, m, K, theta);

angles = linspace(0, pi / 2, 100);
displacement = arrayfun(distance, angles);
displacement(1) = 0;

plot(angles, displacement);
title('Horizontal Displacement vs Firing Angle');
xlabel('Firing Angle (theta)');
ylabel('Horizontal Displacement (m)');
yline(15000);

% Remove exponential notation from axis tick labels
ax = gca;
ax.YAxis.Exponent = 0;
