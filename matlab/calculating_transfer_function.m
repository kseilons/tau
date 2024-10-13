A=[0 0 1 0;0 0 0 1;0 -0.1134 0 0;0 6.6156 0 0];
B=[0; 0; 0.0029; -0.0019];
C=[1 0 0 0];D=0;

F1=eye(4);a1=-trace(A);
F2=F1*A+a1* eye(4);a2=-(1/2)*trace(F2*A);
F3=F2*A+a2* eye(4);a3=-(1/3)*trace(F3*A);
F4=F3*A+a3* eye(4);a4=-(1/4)*trace(F4*A);
Pogr=F4*A+a4*eye(4)
syms p
h=p^4+a1*p^3+a2*p^2+a3*p+a4;
W=C*((F1*p^3+F2*p^2+F3*p+F4)/h)*B+D;
Wpa=vpa(W,5);
pretty(expand(Wpa))

%sys=ss(A,B,C,D);
%tf(sys)
