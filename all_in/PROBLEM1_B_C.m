% Panagiotis Christodoulou AM 5501
% Charalampos Kounnapis AM 5401
% Dimitris Dimitriou AM 5399

% Pinakas 1 kai Pinakas 2
AM=5501;
m1 = 1.0;
m2 = 0.5;
g = 9.81;
tau1 = 0.0 + AM / 200000;
f2 = 4.0 + AM / 2000;
theta1_0 = pi / 2;
d2_0 = 0.03 + AM / 20000;
Izz1 = 0.03;
Izz2 = 0.015;
l1 = 0.15;
h = 0.001; % vima
t_max = 5; % megisto diastima
N = t_max / h;

% arxikes sinthikes
theta1 = zeros(1, N);
d2 = zeros(1, N);
theta1_tonos = zeros(1, N);
d2_tonos = zeros(1, N);
theta1(1) = theta1_0;
d2(1) = d2_0;

% praxi mesa stin parenthesi theta''1
den_theta1 = m1 * l1^2 + Izz1 + Izz2 + m2 * d2(1)^2;

% Euler
for i = 1:N-1
    theta1_dtonos = (tau1 - 2 * m2 * d2(i) * theta1_tonos(i) * d2_tonos(i)-(m1 * l1 + m2 * d2(i)) * g * cos(theta1(i)))/ (m1 * l1^2 + Izz1 + Izz2 + m2 * d2(i)^2);

    d2_dtonos = (f2 + m2 * d2(i) * theta1_tonos(i)^2 - m2 * g * sin(theta1(i))) / m2;
    theta1_tonos(i+1) = theta1_tonos(i) + h * theta1_dtonos;
    d2_tonos(i+1) = d2_tonos(i) + h * d2_dtonos;

    % allagi theseon (neo h)
    theta1(i+1) = theta1(i) + h * theta1_tonos(i);
    d2(i+1) = d2(i) + h * d2_tonos(i);
end

% xronos 0-5
t = 0:h:t_max-h;

% Provlima 1 C (grafikes parastasis)
figure;
subplot(2, 2, 1);
plot(t, theta1);
xlabel('t (s)');
ylabel('\theta_1 (rad)');
title('\theta_1(t)');
subplot(2, 2, 2);
plot(t, theta1_tonos); xlabel('t (s)');
ylabel('\theta''_1 (rad/s)');
title('\theta''_1(t)');
subplot(2, 2, 3);
plot(t, d2); xlabel('t (s)');
ylabel('d_2 (m)');
title('d_2(t)');
subplot(2, 2, 4);
plot(t, d2_tonos); xlabel('t (s)');
ylabel('d''_2 (m/s)');
title('d''_2(t)');

