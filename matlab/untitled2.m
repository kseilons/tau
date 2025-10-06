n=4;
A=[0 0 1 0;0 0 0 1;0 -0.1134104046 0 0;0 6.615606936 0 0];
B=[0; 0; 0.00289017; -0.00192678];
A_d = [
  1.0, -0.00131165, 0.1511355, -0.00006574791;
   0,    1.076513,         0,      0.1549708;
   0,  -0.0175753,       1.0,    -0.00131165;
   0,    1.025226,         0,       1.076513;
];
B_d = [
   0.000033126;
   -0.000021975;
   0.00043842;
  -0.00029444
];

C=[1 0 0 0];
C_d=[1 0 0 0];
h = 0.1511;

% Переход к канонической форме Фробениуса

% 1)

a = poly(A)
a_d = poly(A_d)

disp(a_d(1))
disp(a_d(3))
T = [0 a(3) 0 1
     a(3) 0 1 0
     1 0 0 0];
T_d = [a_d(5) a_d(3) 1
       a_d(3) 1 0
       1 0 0];

S_y = [B A*B (A^2)*B];
S_y_d = [B_d A_d*B_d (A_d^2)*B_d];

Q = S_y * T;
Q_d = S_y_d * T_d;

% 2)

A_hat = Q^-1 * A * Q;
B_hat = Q^-1 * B;
A_hat_d = Q_d^-1 * A_d * Q_d;
B_hat_d = Q_d^-1 * B_d;

% Построение модального регулятора и наблюдателя

% 1)

lambda_ust = [-0.1, -0.2, -0.3];
lambda_ust_d = exp(lambda_ust * h);

a_ust = poly(lambda_ust);
a_ust_d = poly(lambda_ust_d);

lambda_n = lambda_ust - 0.1;
lambda_n_d = exp(lambda_n * h);

a_n = poly(lambda_n);
a_n_d = poly(lambda_n_d);

% 2)

S_n = [C' A'*C' ((A')^2)*C'];
S_n_d = [C' A_d'*C' ((A_d')^2)*C'];

Q_n = S_n * T;
Q_n_d = S_n_d * T_d;

% 3)

k_p = Q'^-1 * (a(end:-1:2) - a_ust(end:-1:2))';
k_p_d = Q_d'^-1 * (a_d(end:-1:2) - a_ust_d(end:-1:2))';

L = -Q_n'^-1 * (a(end:-1:2) - a_n(end:-1:2))';
L_d = -Q_n_d'^-1 * (a_d(end:-1:2) - a_n_d(end:-1:2))';

% 4)

A_z = [A + B * k_p', -B * k_p';
       zeros(n), A - L * C];
b_z = [B; zeros(n, 1)];
C_z = [C, zeros(1, n)];
A_z_d = [A_d + B_d * k_p_d', -B_d * k_p_d';
         zeros(n), A_d - L_d * C];
b_z_d = [B_d; zeros(n, 1)];

eig_A_z = eig(A_z);
eig_A_z_d = eig(A_z_d);

% Точка равновесия системы
y_p = 100;
u_p = (D - C * (A + B * k_p')^-1 * B)^-1 * y_p;
u_p_d = (D + C * (eye(n) - A_d - B_d * k_p_d')^-1 * B_d)^-1 * y_p;
