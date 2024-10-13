
Ag = [
    1.0, -0.02710295, 0.6724362, -0.005942409;
    0,    1.354394,   0,         0.7501382;
    0,   -0.08506567, 1.0,      -0.02710295;
    0,    1.112305,   0,         1.354394
];
Bg = [
    0.00065752;
   -0.00045411;
    0.0019614;
   -0.0014253
];
C=[1 0 0 0];D=0;
n = 5;

num = zeros(1, n+1);
den = zeros(1, n+1);
den(1) = 1; 
num(1) = 0; 
N = eye(n); 

T_d=1/norm(A,2);
sys=ss(A,B,C,D);
sysd=c2d(sys,T_d);
 
[A, B,C,D] = ssdata(sysd)
for k = 1:n
    ak = -1/k * trace(N * A);
    bk = C * N * B;
    Nk1 = N * A + ak * eye(n);
    den(k+1) = ak;
    num(k+1) = bk;
    N = Nk1;
end
