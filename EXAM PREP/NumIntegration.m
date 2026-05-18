clear;format compact;close all; clc

% Numercial integration

Lpp = 144; % Length between perpendiculars [m]
Loa = 165.6; % Length overall [m]

xx = [0 % x coordinates
7.2
14.4
21.6
39.6
57.6
75.6
93.6
111.6
129.6
147.6
165.6];

% NB: Obviously, it makes no difference to use the "original" a-coordinate
x = xx-21.6;

y = [0.0    % Waterline breadths
9.6
14.0
17.0
20.8
22.4
22.6
21.6
18.6
12.8
5.6
0.0];

Aw = trapz(xx,2*y) % Water plane area = int(B(x))dx = int(2*y(x))dx
Aw0 = trapz(x,2*y);

x2y = xx.*(2*y); % Area moment of 'area slices' along x-direction

Mom_wa = trapz(xx,x2y); % Area moment of water plane

x_F = Mom_wa/Aw % Geometric centre of waterplane (this is also the Centre of Floatation ("flydecenter" in Danish)
x_F0 = trapz(x,x.*(2*y))/Aw0 + 21.6;
