signal=zeros(1,500);
signal(125:375)=1;
N=length(signal);
ak=FourierCoeffGen(signal);
%figure;
%stem(abs(ak));
%hold on
%xlabel('n')
%ylabel('a(n)');
%title('Fourier coefficients vs discrete time scale');
for k=1:500
ak_analyt(k)= (sin(k*pi*251/500))/(500*sin(k*pi/500));
end
%ak_analyt(end)=0.5;
%stem(abs(ak_analyt),'r*');
%legend('Numerical','Analytical');
%xlabel('n')
%ylabel('a(n)');
%title('Fourier coefficients vs discrete time scale');

fs=FourierSeries(ak);
stem(fs);
ylabel('X(n)');
xlabel('n')
title('Signal on time scale');