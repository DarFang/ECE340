%Lab question 1
%parta
Fs = 22050
fc = 2500
wc=fc/(Fs/2);
% fc: The cut-off frequency of the filter
% Fs: Sampling frequency of the audio signal
window = hamming(513);
% Truncation window function, using Hamming window. 
% Other truncation window typesmay also be applicable. Please use
% Matlab help to find more applicable truncation windows. 
filter_coeff=fir1(513-1,wc, window); 
% filter_coeff: Coefficients of the FIR filter

%partb
freqz(filter_coeff,1); 
%The frequency response of the filter

%partc readaudio signel
[x,Fs1]  = audioread("love_mono22.wav");


%partd pass audio through filter

x_filtered=filter(filter_coeff,1,x);

%x_filtered: The filtered signal

%parte 
[pxx, f] = pwelch(x,500,300,500,Fs1);
figure()
[pxx1, f] = pwelch(x_filtered,500,300,500,Fs1);



%partf save modified to .wavfile
audiowrite('love_mono22LowPass.wav', x_filtered, Fs);

%Q2 High pass
fc = 5000;
Fs = 22050;

wc=fc/(Fs/2);
window = hamming(513); 
filter_coeff=fir1(513-1,wc, window); 

%partb
freqz(filter_coeff,1); 
%The frequency response of the filter

%partc readaudio signel
[x,Fs1]  = audioread("love_mono22.wav");


%partd pass audio through filter

x_filtered=filter(filter_coeff,1,x);
%x_filtered: The filtered signal

%parte
figure()
[pxx2, f] = pwelch(x_filtered,500,300,500,Fs1);



%partf save modified to .wavfile
audiowrite('love_mono22HighPass.wav', x_filtered, Fs);



% band stop
fc = [2800, 3200];
Fs = 22050;

wc=fc/(Fs/2);
window = hamming(513); 
filter_coeff=fir1(513-1,wc, 'stop', window); 

%partb
freqz(filter_coeff,1); 
%The frequency response of the filter

%partc readaudio signel
[x,Fs1]  = audioread("love_mono22.wav");


%partd pass audio through filter

x_filtered=filter(filter_coeff,1,x);
%x_filtered: The filtered signal

%parte
[pxx3, f] = pwelch(x_filtered,500,300,500,Fs1);

figure("name", "Plots")
subplot(4, 1, 1)
plot(f/1000, 10*log10(pxx))
title('File love\_mono22.wav')
xlabel('Frequency[kHz]')
ylabel('PSD[dB/Hz]')
subplot(4, 1, 2)
plot(f/1000, 10*log10(pxx1))
title('File with low pass filter')
xlabel('Frequency[kHz]')
ylabel('PSD[dB/Hz]')
subplot(4, 1, 3)
plot(f/1000, 10*log10(pxx2))
title('File with high pass filter')
xlabel('Frequency[kHz]')
ylabel('PSD[dB/Hz]')
subplot(4, 1, 4)
plot(f/1000, 10*log10(pxx3))
title('File with stop band filter')
xlabel('Frequency[kHz]')
ylabel('PSD[dB/Hz]')

%partf save modified to .wavfile
audiowrite('love_mono22C.wav', x_filtered, Fs);



