% ����������� ������ A, B, C, D
A = [0 0 1 0;
     0 0 0 1;
     0 -0.1134 0 0;
     0 6.6156 0 0];
B = [0; 0; 0.0029; -0.0019];
C = [1 0 0 0]; 
D = 0;

% ���������� ������� ����������
sys = ss(A, B, C, D);
W_numeric = tf(sys);  % ��������� ������������ �������

% ����� ��������� ������� � �����
[z1, p1, k1] = zpkdata(W_numeric, 'v'); % ��������� �����

disp('������ ���������� ������:')
disp(p1)

disp('���� ���������� ������:')
disp(z1)

% ���������� ������������ �������
F1 = eye(4);
a1 = -trace(A);
F2 = F1 * A + a1 * eye(4);
a2 = -(1/2) * trace(F2 * A);
F3 = F2 * A + a2 * eye(4);
a3 = -(1/3) * trace(F3 * A);
F4 = F3 * A + a3 * eye(4);
a4 = -(1/4) * trace(F4 * A);

syms p
h = p^4 + a1 * p^3 + a2 * p^2 + a3 * p + a4;
W = C * ((F1 * p^3 + F2 * p^2 + F3 * p + F4) / h) * B + D;
Wpa = vpa(W, 5);  % ���������� ������������ �������

% ���������� ������� � ����� ������� ��� ������������� �������:
[num, den] = numden(W);  % ��������� � �����������
poles_symbolic = solve(den == 0, p);  % ������
zeros_symbolic = solve(num == 0, p);  % ����

disp('������ �������������� ������:')
disp(vpa(poles_symbolic, 5))

disp('���� �������������� ������:')
disp(vpa(zeros_symbolic, 5))
