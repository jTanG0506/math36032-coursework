function d = distance_function(g, v, m, K, theta)
  [~, z] = projection_solution(g, v, m, K, theta, 0);
  d = z(end, 1);
end