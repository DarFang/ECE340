%Q1
x = (0:4);
k = (0:length(x)-1);

figure('Name', 'Convolution')
subplot(3, 1, 1)
stem(k,x)
title('Discrete plot of x[k]')
xlabel('k')
ylabel('Amplitude')
subplot(3, 1, 2)

h = (2:-1:-1);
k1 = (0:length(h)-1);
stem(k1,h)
title('Discrete plot of h[k]')
xlabel('k')
ylabel('Amplitude')

y = conv(x,h);
k2 = (0:length(y)-1);
subplot(3, 1, 3)
stem(k2,y)
title('Discrete plot of y[k]')
xlabel('k')
ylabel('Amplitude')

%Q2
clear
k = (0:50);
h = 0.3*sinc(0.3.*(k-25)).*(0.54-0.46*cos(2*pi.*k/50));

[x,Fs]  = audioread("baila.wav");

figure('Name', 'Convolution on wav')
y = conv(h,x);
k1 = (0:length(y)-1);
stem (y,k1)
title('Discrete plot of h[k]')
xlabel('k')
ylabel('h[k]')

audiowrite('baila_filtered.wav', y, Fs)

%Q3
clear
%x1 = cos(20*pi.*t)
%x2 = cos(180*pi.*t)
% fz = 100Hz
n1 = (0:30);
y1 = cos(20*pi.*n1/100);
y2 = cos(180*pi.*n1/100);
y3 = cos(220*pi.*n1/100);

figure('Name', 'Alising with 100Hz')
subplot(2,1,1);
stem(n1, y1)

title('Discrete plot of y1[n]')
xlabel('n')
ylabel('y1')

subplot(2,1,2);
stem(n1, y2)

title('Discrete plot of y2[n]')
xlabel('n')
ylabel('y2')

fs1 = 100;
fs2 = 1000;
n2 = (0:300);
z1 = cos(20*pi.*n2/1000);
z2 = cos(180*pi.*n2/1000);

figure('Name', 'Alising with 1000Hz')
subplot(2,1,1);
stem(n2, z1)

title('Discrete plot of z1[n]')
xlabel('n')
ylabel('z1')

subplot(2,1,2);
stem(n2, z2)

title('Discrete plot of z2[n]')
xlabel('n')
ylabel('z2')

figure('Name', 'Alising compare')
subplot(2,1,1);
plot(n2/fs2,z1,'r-', n1/fs1,y1,'b+'); 
xlabel('n'); ylabel('y_1[n] and z_1[n]'); 
legend('z_1[n]','y_1[n]');
subplot(2,1,2);
plot(n2/fs2,z2,'r-', n1/fs1,y2,'b+');
xlabel('n'); 
ylabel('y_2[n] and z_2[n]'); 
plot(n2/fs2,z2,'r-', n1/fs1,y2,'b+');
xlabel('n'); ylabel('y_1[n] and z_1[n]'); 
legend('z_1[n]','y_1[n]');
subplot(2,1,2);
plot(n2/fs2,z2,'r-', n1/fs1,y2,'b+');
xlabel('n'); ylabel('y_2[n] and z_2[n]'); 
legend('z_2[n]','y_2[n]');

figure('Name', 'Another example of y1 and y2')

subplot(2,1,1);
stem(n1, y1)

title('Discrete plot of y1[n]')
xlabel('n')
ylabel('y1')

subplot(2,1,2);
stem(n1, y3)

title('Discrete plot of y3[n]')


xlabel('n')
ylabel('y3')

clear
%Q4
figure('Name', 'Original');
img = imread("barbaraLarge.jpg");

imshow(img), colorbar;
figure('Name', '0.9 scale with antialiasing');
a = imresize(img, 0.9, 'nearest', 'antialiasing', 1);
imshow(a), colorbar;

figure('Name', '0.7 scale with antialiasing');
b = imresize(img, 0.7, 'nearest', 'antialiasing', 1);
imshow(b), colorbar;

figure('Name', '0.5 scale with antialiasing');
c = imresize(img, 0.5, 'nearest', 'antialiasing', 1);
imshow(c), colorbar;

figure('Name', '0.9 scale without antialiasing');
a1 = imresize(img, 0.9, 'nearest', 'antialiasing', 0);
imshow(a1), colorbar;

figure('Name', '0.7 scale without antialiasing');
b1 = imresize(img, 0.7, 'nearest', 'antialiasing', 0);
imshow(b1), colorbar;

figure('Name', '0.5 scale without antialiasing');
c1 = imresize(img, 0.5, 'nearest', 'antialiasing', 0);
imshow(c1), colorbar;


