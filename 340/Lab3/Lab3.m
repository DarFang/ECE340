
clear
%Q1 a, d
n1 = (0:10);
n = n1;
%equation
h = n.*(0.5).^n .*sin(pi.*n/6);

%delta impulse function
impulse = zeros([1 11]);
impulse(1) = 1;

%Z transform
syms n
H = ztrans(n.*(0.5).^n .*sin(pi.*n/6));
N = [0, 4, 0, -1, 0];
D = [16, -16*3^(1/2), 20, -4*3^(1/2), 1]; 

%filter using Z transform
h2 = filter (N, D, impulse);
figure('Name', 'Z-Transform')

%all plots
subplot(4, 1, 1)
stem(n1,h)
title('Discrete plot of h1[n]')
xlabel('n')
ylabel('h1[n]')

subplot(4, 1, 2)
stem(n1,h2)
title('Discrete plot of h2[n]')
xlabel('n')
ylabel('amplitude')

subplot(4, 1, 3)
stem(impulse)
title('impulse')
xlabel('n')
ylabel('amplitude')

subplot(4, 1, 4)
plot(n1,h2,'r-', n1, h,'b+');
legend('h2','h1');
title('Discrete plot of h1[n] with impulse')
xlabel('n')
ylabel('h2[n]')


   
clear
%Q2 part 1
figure('Name', 'zeros and poles')
z1 = [2,2];
h1 = [1,-1.25];
subplot(2, 1, 1)
zplane(z1,h1);
title('H1 on z plane')

z2 = [2,2];
h2 = [1,-0.8];
subplot(2, 1, 2)
zplane(z2,h2);

title('H2 on z plane')


%Q2 part 2
w = (1:200)*2*pi/200;
H1 = (2+2.*exp(-j.*w))./(1-1.25.*exp(-j.*w));
figure('Name','Magnitude and Phase of H1') 
subplot(2, 1, 1)
plot(w, abs(H1))
title('H1 magnitude')
xlabel('w')
ylabel('magnitude')

subplot(2, 1, 2)
plot(w, angle(H1))
title('H1 angle')
xlabel('w')
ylabel('angle')




H2 = (2+2.*exp(-j.*w))./(1-0.8.*exp(-j.*w));

figure('Name','Magnitude and Phase of H2') 
subplot(2, 1, 1)
plot(w, abs(H2))
title('H2 magnitude')
xlabel('w')
ylabel('magnitude')

subplot(2, 1, 2)
plot(w, angle(H2))
title('H2 angle')
xlabel('w')
ylabel('angle')



%Q2 part 3
figure('name', 'h1[n] and h2[n]')
syms z1 n1
H1 = (2*z1+2)/(z1-1.25);
zh1 = iztrans(H1, z1, n1);

n1 = (0:25);
h1 = subs(zh1, sym('n1'), n1);
subplot(2, 1, 1)
stem(n1, h1);
title('h1[n] plot')
xlabel('n')
ylabel('h1')


syms z2 n2
H2 = (2*z2+2)/(z2-0.8);
zh2 = iztrans(H2, z2, n2);

n2 = (0:25);
h2 = subs(zh2, sym('n2'), n2);
subplot(2, 1, 2)
stem(n2, h2);
title('h2[n] plot')
xlabel('n')
ylabel('h2')

