figure('Name', 'zeros and poles')
z1 = [0,1,0,0,-1];
h1 = [1,0,-0.25,0, 0];
subplot(2, 1, 1)
zplane(z1,h1);
title('H1 on z plane')