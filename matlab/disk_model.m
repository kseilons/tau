% ���������� �������� ������� A � B
A=[0 0 1 0;0 0 0 1;0 -0.1134 0 0;0 6.6156 0 0];
B = [0; 0; 0.0029; -0.0019];
C = [1 0 0 0];

% ��������� ������ ����� ������� A
T_d = 1 / norm(A, 2)

% ��������� ������� Ag
Ag = expm(A * T_d);
Ag = vpa(Ag, 7);

% ��������� ������� Bg � �������������� ������� integral ��� ��������������
Bg=quadv(@(t)expm(A*t), 0,T_d)*B;
Bg = vpa(Bg, 5);

% ����� �����������
disp('Ag = ');
disp(Ag);
disp('Bg = ');
disp(Bg);
