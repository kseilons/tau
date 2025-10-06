format long

G = [1,1,1,1];
F = diag([-1,-2,-1.5, -0.5]);
Fd = diag([0.5, 0.8, 0.3, 0.2]);
S_H_G = [G', F'*G', F'^2*G', F'^3*G']
Sd_H_G = [G', Fd'*G', Fd'^2*G', Fd'^3*G']
rank_S_H = rank(S_H_G)
rank_Sd_H = rank(Sd_H_G)