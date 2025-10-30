% Panagiotis Christodoulou AM 5501
% Charalampos Kounnapis AM 5401
% Dimitris Dimitriou AM 5399

% Pinkas 4
AM=5501;
m2 = 0.5;
g = 9.81;

% Pinakas 3
Kp2 = 1200.0;
Kd2 = 15.0 + AM / 300;
d2_des = -0.4 + AM / 100000;

p = Kd2 / m2; % L_1 + L_2
q = Kp2 / m2; % L_1 * L_2

% Tetragonikos Typos +-
L1 = (-p + sqrt(p^2 - 4*q)) / 2;
L2 = (-p - sqrt(p^2 - 4*q)) / 2;

% Statheri katastasi
steady_state = d2_des - (m2 * g / Kp2);

% Arxikes sinthikes
d2_0 = 0.03 + AM / 20000;
d2_tonos_0 = 0;

% Lynoume gia C1 kai C2
C1_plus_C2 = d2_0 - steady_state;
C1_L1_plus_C2_L2 = d2_tonos_0;

% Kanoume Systima exisoseon gia to C1 and C2
A = [1, 1; L1, L2];
B = [C1_plus_C2; C1_L1_plus_C2_L2];
C = A \ B; % Lynoume to grammiko systima
C1 = C(1);
C2 = C(2);

% Xronos
t = linspace(0, 5, 1000); %1000 simia

% analitiki lisi gia d2(t)
d2 = steady_state + C1 * exp(L1 * t) + C2 * exp(L2 * t);

% analitiki lisi gia d2'(t)
d2_tonos = L1 * C1 * exp(L1 * t) + L2 * C2 * exp(L2 * t);

% Erotima 2 C
% grafiki d2(t)
figure;
subplot(2, 1, 1);
plot(t,d2,'b','LineWidth', 1);
xlabel('t (s)');
ylabel('d_2 (m)');
title('d_2(t) - Metatopisi tou Defterou Sindesmou');
grid on;

% Grafiki d2'(t)
subplot(2, 1, 2);
plot(t,d2_tonos,'r','LineWidth', 1);
xlabel('t (s)');
ylabel("d'_2 (m/s)");
title('d''_2(t) - Metaforiki taxitita tou Defterou Sindesmou');
grid on;

