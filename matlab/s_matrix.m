% Определяем исходные матрицы A и B
A=[0 0 1 0;0 0 0 1;0 -0.1134 0 0;0 6.6156 0 0];
B = [0; 0; 0.0029; -0.0019];
C=[1 0 0 0];
% Определяем матрицы с волной (Avoln и Bvoln)
Avoln = [0 1 0 0; 6.6156 0 1 0; 0 0 0 1; 0 0 0 0];
Bvoln = [0; 0.0029; 0; -0.01897];
Cvoln = [1 0 0 0];

% Вычисление b, Ab, A^2b, A^3b, A^4b для A и B
b = B;
Ab = A * B;
A2b = A * Ab;
A3b = A * A2b;

% Создание матрицы Sy (состояния для исходной системы)
Sy = [b, Ab, A2b, A3b];

% Вычисление bvoln, Abvoln, A^2bvoln, A^3bvoln для Avoln и Bvoln
bvoln = Bvoln;
Abvoln = Avoln * Bvoln;
A2bvoln = Avoln * Abvoln;
A3bvoln = Avoln * A2bvoln;

% Создание матрицы Syvoln (состояния для системы с волной)
Syvoln = [bvoln, Abvoln, A2bvoln, A3bvoln];

% Вычисление матрицы  S и погрешностей
S = Sy * inv(Syvoln);

Pog_A = Avoln - inv(S)*A*S
Pog_B = Bvoln - inv(S)*B
pog_C = Cvoln - C*S
% Вывод результатов
disp('Матрица Sy = ');
disp(Sy);

disp('Матрица Syvoln = ');
disp(Syvoln);

disp('Матрица S = ');
disp(S);
