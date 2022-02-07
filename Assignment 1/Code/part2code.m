%% Fourier series of two frames of 512 samples of the signal
%1. Identify the k0 of your disturbing signal.
ID = 205868771;
[inputSignal,fs,SNR_in] = inputSignalBuilder(ID);
Nframe = 512;
k0 = 227;
%% Generate an appropriate filter
%2.modify H as needed, use k0
H = ones(1,512);
H(k0)=0;
H(Nframe-k0)=0;

%% Filter frame by frame
z = zeros(size(inputSignal));
for n=1:floor(length(inputSignal)/Nframe) % Frame based operation, Add as many lines as needed
    y_frame = inputSignal((n-1)*Nframe+1:n*Nframe);%...
    ak_frame=FourierCoeffGen(y_frame);
    new_ak=ak_frame.*H;
    %stem(new_ak);
    z_frame=FourierSeries(new_ak);
    z((n-1)*Nframe+1:n*Nframe) =z_frame(1:512) ; %...
end
%% Check results
z = real(z);
soundsc(z,fs)
audiowrite(['Output' num2str(ID) '.wav'],z,fs)
[x, fs]= audioread('about_time.wav');
SNR_out = 10*log10(mean(x.^2)/mean((z-x).^2))
%% Performace evaluation:
 [Grade, SNR_out_ref]= GradeMyOutput(ID,z);
