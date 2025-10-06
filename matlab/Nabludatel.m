clc
n=4
A=[0 0 1 0;0 0 0 1;0 -0.1134104046 0 0;0 6.615606936 0 0];
b=[0; 0; 0.00289017; -0.00192678];
Ad = [
  1.0, -0.00131165, 0.1511355, -0.00006574791;
   0,    1.076513,         0,      0.1549708;
   0,  -0.0175753,       1.0,    -0.00131165;
   0,    1.025226,         0,       1.076513;
];
bd = [
   0.000033126;
   -0.000021975;
   0.00043842;
  -0.00029444
];

C=[1 0 0 0];
Cd=[1 0 0 0];
h = 0.1511;
lambda_ust = [-1, -2, -1.5, -0.5];
lambda_ust_d = exp(lambda_ust * h);

T = [0        -6.615606936       0        1;
    -6.615606936 0               1        0;
    0          1               0          0;
    1          0               0          0];
            
Td = [-4.15302    6.30605    -4.153026   1;
  6.30605   -4.153026    1         0;
 -4.153026   1          0         0;
  1         0          0         0];

S_y = [b, A*b, A^2*b, A^3*b];
Sd_y = [bd, Ad*bd, Ad^2*bd, Ad^3*bd];

S_n = [C', A'*C', A'^2*C', A'^3*C'];
S_n_d = [Cd', Ad'*Cd', Ad'^2*Cd', Ad'^3*Cd'];

lambda_n = lambda_ust - 0.5;
lambda_n_d = exp(lambda_n * h);

a = poly(A);
ad = poly(Ad);
a_ust = poly(lambda_ust);
a_ust_d = poly(lambda_ust_d);

a_n = poly(lambda_n);
a_n_d = poly(lambda_n_d);

Q = S_y * T

Qd = Sd_y * Td

Q_n = S_n * T
Q_n_d = S_n_d * Td

A_kanon = Q^-1 * A * Q
Ad_kanon = Qd^-1 * Ad * Qd

b_kanon = Q^-1 * b
bd_kanon = Q^-1 * bd

k_p = Q'^-1 * (a(end:-1:2) - a_ust(end:-1:2))'
k_p_d = Qd'^-1 * (ad(end:-1:2) - a_ust_d(end:-1:2))'

L = -Q_n'^-1 * (a(end:-1:2) - a_n(end:-1:2))'
L_d = -Q_n_d'^-1 * (ad(end:-1:2) - a_n_d(end:-1:2))'

A_z = [A + b * k_p', -b * k_p'
       zeros(n), A - L * C]
b_z = [b; zeros(n, 1)]
C_z = [C, zeros(1, n)]
A_z_d = [Ad + bd * k_p_d', -bd * k_p_d'
         zeros(n), Ad - L_d * C]
b_z_d = [bd; zeros(n, 1)]

eig_A_z = eig(A_z)
eig_A_z_d = eig(A_z_d)

