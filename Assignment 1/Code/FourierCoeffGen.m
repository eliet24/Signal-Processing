function [ak] = FourierCoeffGen(signal)
N=length(signal);
w0=2*pi/N;
ak = zeros(1,N);
syms n;
for k = 1:N
    ak(k)=0;
    for n= 1:N
        val=signal(n);
        ak(k)= ak(k)+val*exp(-1i*k*w0*n); % ak is fourier coefficient
    end
     ak(k)=ak(k)/N;
end
end

