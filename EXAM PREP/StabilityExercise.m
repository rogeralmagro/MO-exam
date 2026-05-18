clear;format compact;close all; clc

% Stability exercise (41107)

g = 9.81;       % Acceleration of gravity [m/s^2]

L = 80;         % [m]
B = 20;         % [m]
Dsand = 1.75;   % [m]
rho_s = 1600;   % [kg/m^3]
rho_w = 1025;   % [kg/m^3]

%% Question 1

W = L*B*Dsand*rho_s;    % Weight (W) = 4,480,000 kg
T = W/(rho_w*L*B);      % Draught (T) = 2.73 m

%% Question 2

Nabla = L*B*T;          % Displacement (volume) = 4,371 m^3
KG = Dsand/2;           % KG = 0.875 m
KB = T/2;               % KB = 1.366 m
I = 1/12*L*B^3;         % Waterplane moment of inertia (I) = 53.3e3 m^4

BMT = I/Nabla;          % BMT = 12.2 m;
GMT = (KB+BMT) - KG;    % GMT = 12.7 m; (NO stability problems!)

%% Question 3

phi = 7;                                % Angle of heel = 7 degrees
Mr0 = rho_w*g*Nabla*(GMT*sind(phi));    % Restoring moment = 68.0 MNm

%% Question 4

% We apply the wall-sided formula (see Example 5.2, p. 39 in Nielsen, 2013), as this
% gives the exact value of the "righting lever":

Mr1 = rho_w*g*Nabla*sind(phi)*(GMT+0.5*BMT*tand(phi)^2); % Restoring moment = 68.5 MNm

