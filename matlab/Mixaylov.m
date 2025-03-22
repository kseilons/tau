
a0 = -1;
a1 = 0;
a2 = 6.615606936;
a3 = 0;
a4 = 0;
%
%
w=[0:0.001:0.2];
s=1i*w;
a=a0*s.^4+a1*s.^3+a2*s.^2+a3*s+a4;

plot([0,real(a)],[0,imag(a)])
grid on
ylabel('Im')
xlabel('Re')
% Дискретная модель
a0 = -0.006026;
a1 = 1;
a2 = - 2.9572747
a3 = 2.9151507;
a4 = -0.98575825370;
w=0:0.000001:pi/2;
s=exp(1i*w);
ad=a1*s.^3+a2*s.^2+a3*s+ a4;
plot(real(ad),imag(ad))
grid on
ylabel('Im')
xlabel('Re')