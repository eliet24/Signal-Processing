
close all
clc
clear
%% Generation of noisey signal
% Enter your ID  
ID = 205868771;
[inputSignal,fs,SNR_in] = inputSignalBuilder(ID);
soundsc(inputSignal,fs)
figure();stem(0:length(inputSignal)-1,inputSignal);
xlabel('n','fontsize',16);
ylabel('signal','fontsize',16);
%% Signal analysis
%%%%%%%
%In this part the input signal is examined. We assume a pure tone
%disturbance of cos((2*pi/512)*k0*n), and have to locate k0

%% Fourier series of two frames of 512 samples of the signal
%1. Identify the k0 of your disturbing signal.
Nframe = 512;
FourierCoeff1 =  FourierCoeffGen(inputSignal(1:Nframe));
FourierCoeff2 = FourierCoeffGen(inputSignal((end-Nframe+1):end));
figure();
stem(0:(Nframe-1),abs(FourierCoeff1));
hold on
stem(0:(Nframe-1),abs(FourierCoeff2));
title('Fourier coefficients of frames');
xlabel('k','fontsize',16);
ylabel('|a_k|','fontsize',16);
legend('First frame','Last frame')
% what is k0?
k0 = 228;
%% Generate an appropriate filter
%2.modify H as needed, use k0
H = ones(1,Nframe);
H(k0)=0;
H(512-k0)=0;
%% Filter frame by frame
z = zeros(size(inputSignal));
for n=1:floor(length(inputSignal)/Nframe) % Frame based operation, Add as many lines as needed
    y_frame = H*inputSignal; %...
...    
...
    z((n-1)*Nframe+1:n*Nframe) = z+y_frame; %...
end
%% Check results
%if needed, add z = real(z);
soundsc(z,fs)


audiowrite(['Output' num2str(ID) '.wav'],z,fs)
[x, fs]= audioread('about_time.wav');
SNR_out = 10*log10(mean(x.^2)/mean((z-x).^2))

%% Performace evaluation:
 [Grade, SNR_out_ref]= GradeMyOutput(ID,z);
