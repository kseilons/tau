G = eye(4);
Bg = [
   0.000033126;
   -0.000021975;
   0.00043842;
  -0.00029444
];
B=[0; 0; 0.00289017; -0.00192678];
BG = B' * G
BdG = Bg' * G