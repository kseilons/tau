a0 = -1;
a1 = 0;
a2 = 6.615606936;
a3 = 0;
a4 = 0;
M_1=[a1, a0, 0, 0;
     a3, a2, a1, a0;
     0, a4, a3, a2;
     0, 0, 0, a4];

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

% %Дискретная модель
% multiplier = 15.56687080737388584328328988704;
% a0 = multiplier*( 0.0000000076766050885735858787218014877565)
% a1 = multiplier*(0.0000016945141225651255771740287343581)
% a2 = multiplier*(0.0091857583086123573675178013208698)
% a3 = multiplier*(0.018636319757186867628585342795463)
% a4 = multiplier*(1)
% M_1=[a1, a0, 0, 0;
% a3, a2, a1, a0;
% 0, a4, a3, a2;
% 0, 0, 0, a4]
% M_2=[a1, a0, 0;
% a3, a2, a1;
% 0, a4, a3];
% M_3=[a1, a0;
% a3, a2];
% M_4=a1;
%
% det_M_1 = det(M_1);det_M_2 = det(M_2);
% det_M_3 = det(M_3);det_M_4 = det(M_4);
%
% disp("det_M_1 = " + det_M_1);disp("det_M_2 = " + det_M_2);
% disp("det_M_3 = " + det_M_3);disp("det_M_4 = " + det_M_4);