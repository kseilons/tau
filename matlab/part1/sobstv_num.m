A = [0 0 1 0; 0 0 0 1; 0 -0.1134 0 0; 0 6.6156 0 0];
% √де eigenvalues - матрица, 
% на диагонали которой расположены собственные числа,
% √де eigenvectors - матрица, 
% где столбцы €вл€ютс€ собственными векторами матрицы.

[eigenvectors, eigenvalues] = eig(A);
disp("eigenvectors A");
disp(eigenvectors);
disp("eigenvalues A");
disp(eigenvalues);

Ad = [
     1.0, -0.001311533, 0.1511357, -0.00006574209;
    0,     1.076513,         0,       0.154971;
    0,  -0.01757371,       1.0,   -0.001311533;
    0,     1.025226,         0,       1.076513
];
[eigenvectors, eigenvalues] = eig(Ad);

disp("eigenvectors Ad");
disp(eigenvectors);
disp("eigenvalues Ad");
disp(eigenvalues);