%a0 = -1;
%a1 = 0;
%a2 = 6.615606936;
%a3 = 0;
%a4 = 0;
a0 = -0.006026;
a1 = -0.000052;
a2 = -0.6;
a3 = 0.000052;
a4 = 16.606;

M_1=[a1, a0, 0, 0;
     a3, a2, a1, a0;
     0, a4, a3, a2;
     0, 0, 0, a4]

M_2=[a1, a0, 0;
     a3, a2, a1;
     0, a4, a3];

M_3=[a1, a0;
    a3, a2];
M_4=a1;

det_M_1 = det(M_1);det_M_2 = det(M_2);
det_M_3 = det(M_3);det_M_4 = det(M_4);
disp("det_M_1 = " + det_M_1);disp("det_M_2 = " + det_M_2);
disp("det_M_3 = " + det_M_3);disp("det_M_4 = " + det_M_4);
