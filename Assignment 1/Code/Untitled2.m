Nframe = 512;
[inputSignal,fs,SNR_in] = inputSignalBuilder(ID);
figure();stem(0:length(inputSignal)-1,inputSignal);
xlabel('n','fontsize',16);
ylabel('signal','fontsize',16);
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