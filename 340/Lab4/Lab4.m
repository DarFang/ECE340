%Part 1
clear
[x,Fs]  = audioread("ubw.wav");

info = audioinfo("ubw.wav")

%part 2
Xr = fft(x);
%b
disp( Xr(1))
disp( Xr(2))
disp( Xr(3))

%c 

N = info.TotalSamples;
X_r = abs(Xr/sqrt(N));
X_r = X_r(1:N/2+1);
figure("name" , "dft")
plot (20*log10(X_r))
xlabel("freq kHz")
ylabel("Fourier Magnitude Spectrum")
xt = get(gca, 'XTick');
set(gca, 'XTick', xt, 'XTickLabel', xt/1000);

%part 3
figure("name" , "power spectrial density")
[x,Fs] = audioread("love_mono22.wav");
audioinfo("love_mono22.wav")
[pxx,f] = pwelch(x,500,300,500,Fs);
plot(f/1000,10*log10(pxx));
xlabel('Frequency (kHz)')
ylabel('PSD (dB/Hz)')

%c on the plot it is at 2.99 khz

%d
figure("name" , "power spectrial density")
[x,Fs] = audioread("ubw.wav");
[pxx,f] = pwelch(x,500,300,500,Fs);
plot(f/1000,10*log10(pxx));
xlabel('Frequency (kHz)')
ylabel('PSD (dB/Hz)')




%part4

figure('Name', 'image');
img = imread("ayantika.tif");

imshow(img);

