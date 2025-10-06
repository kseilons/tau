F = diag([-1, -2, -1.5, -0.5]);
Fd = diag([0.5, 0.8, 0.3, 0.2]);
G = eye(4);

O = obsv(F, G)
Od = obsv(Fd, G)

fprintf('Ранг O: %d, Ранг F: %d, Ранг Od: %d, Ранг Fd: %d\n', rank(O), rank(F), rank(Od), rank(Fd));