function [fs]=FS(ak)
N=length(ak);
w0=2*pi/N;
fs = zeros(1,N);
syms k;
for n = 1:N 
     fs(n)=0;
    for k= 1:N
        val=ak(1,k);
        fs(n)= fs(n)+val*exp(1i*k*w0*n); % ak is fourier coefficient
    end
end
end