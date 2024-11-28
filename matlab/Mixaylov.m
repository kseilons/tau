
%a0 = -1;
%a1 = 0;
%a2 = 6.615606936;
%a3 = 0;
%a4 = 0;
%
%
%w=[0:0.001:5];
%s=1i*w;
%a=a0*s.^4+a1*s.^3+a2*s.^2+a3*s+a4;

%plot([0,real(a)],[0,imag(a)])
%grid on
%ylabel('Im')
%xlabel('Re')
% Дискретная модель
a0 = -0.006026;
a1 = -0.000052;
a2 = -0.6;
a3 = 0.000052;
a4 = 16.606;
w=[0:0.00001:pi];
s=exp(1i*w);
ad=s.^4+a1*s.^3+a2*s.^2+a3*s+ a4;
plot(real(ad),imag(ad))
grid on
ylabel('Im')
xlabel('Re')