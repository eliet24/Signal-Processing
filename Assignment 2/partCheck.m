close all
clc
clear
%% Generation of input signal 
[t, x1,x2, Fs] = inputBuilder();
% soundsc(x,Fs)
%% Fourier transform of input signal
Nt = length(t);
fmax = Fs/2;
fvec = fmax*linspace(-1,1,Nt+1);
fvec = fvec(1:end-1);
wvec = 2*pi*fvec;
Fx1 = fftshift(fft(x1));%up to a factor of dt.
Fx2 = fftshift(fft(x2));
%%
figure(1);plot(fvec,abs(Fx1)');
xlabel('\omega/{2\pi} [Hz]','fontsize',16);
ylabel('Fx1(\omega)','fontsize',16);
set(gca,'fontsize',16);hold on;
 
figure(5);plot(fvec,abs(Fx2)');
xlabel('\omega/{2\pi} [Hz]','fontsize',16);
ylabel('Fx2(\omega)','fontsize',16);
set(gca,'fontsize',16);hold on;
