A = [0 0 1 0; 0 0 0 1; 0 -0.1134 0 0; 0 6.6156 0 0];
Ad = [
     1.0, -0.001311533, 0.1511357, -0.00006574209;
    0,     1.076513,         0,       0.154971;
    0,  -0.01757371,       1.0,   -0.001311533;
    0,     1.025226,         0,       1.076513
];

[S, E] = eig(A); [Sd, Ed] = eig(Ad);
k1 = rank(A^0) - 2*rank(A^1) + rank(A^2);
k2 = rank(A^1) - 2*rank(A^2) + rank(A^3);
k1d = rank((Ad-eye(4))^0) - 2*rank((Ad-eye(4))^1) + rank((Ad-eye(4))^2);
k2d = rank((Ad-eye(4))^1) - 2*rank((Ad-eye(4))^2) + rank((Ad-eye(4))^3);
disp("k1:" + k1 + ",k2: " + k2);
disp("k1d:" + k1d + ",k2d: " + k2d);