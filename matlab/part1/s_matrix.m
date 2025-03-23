% ���������� �������� ������� A � B
A=[0 0 1 0;0 0 0 1;0 -0.1134104046 0 0;0 6.615606936 0 0];
B=[0; 0; 0.00289017; -0.00192678];
C=[1 0 0 0];D=0;
% ���������� ������� � ������ (Avoln � Bvoln)
Avoln = [0 1 0 0; 6.615606936 0 1 0; 0 0 0 1; 0 0 0 0];
Bvoln = [0; 0.00289017; 0; -0.018901711798];
Cvoln = [1 0 0 0];

% ���������� b, Ab, A^2b, A^3b, A^4b ��� A � B
b = B;
Ab = A * B;
A2b = A * Ab;
A3b = A * A2b;

% �������� ������� Sy (��������� ��� �������� �������)
Sy = [b, Ab, A2b, A3b];

% ���������� bvoln, Abvoln, A^2bvoln, A^3bvoln ��� Avoln � Bvoln
bvoln = Bvoln;
Abvoln = Avoln * Bvoln;
A2bvoln = Avoln * Abvoln;
A3bvoln = Avoln * A2bvoln;

% �������� ������� Syvoln (��������� ��� ������� � ������)
Syvoln = [bvoln, Abvoln, A2bvoln, A3bvoln];

% ���������� �������  S � ������������
S = Sy * inv(Syvoln);

Pog_A = Avoln - inv(S)*A*S
Pog_B = Bvoln - inv(S)*B
pog_C = Cvoln - C*S
% ����� �����������
disp('������� Sy = ');
disp(Sy);

disp('������� Syvoln = ');
disp(Syvoln);

disp('������� S = ');
disp(S);
