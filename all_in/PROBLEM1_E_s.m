% Panagiotis Christodoulou AM 5501
% Charalampos Kounnapis AM 5401
% Dimitris Dimitriou AM 5399

% PINAKAS 3
AM=5501;
Kp2 = 1200.0;
Kd2 = 15.0 + AM / 300;
d2_des = -0.4 + AM / 100000;
%PINAKAS 2
m2 = 0.5;
g = 9.81;

h_values = [0.001, 0.01, 0.1]; % 3 times tou Vimatos

t_max = 5; % megistos xronos
for j = 1:length(h_values)    %for loop mexri to 3 (perni to length tou array vimatos)

    h = h_values(j); % perni tin timi h_values gia to analogo J (1,2,3)
    N = t_max / h; % arithmos vimatos
    t = 0:h:t_max-h; % xronos

    % arxikes sinthikes
    d2 = zeros(1, N);
    d2_tonos = zeros(1, N);
    d2(1) = 0; %arxiki thesi 0
    d2_tonos(1) = 0; % arxiki taxititas

    % Euler
    for i = 1:N-1
        % ypologismos tou d2'' xrisimopiontas tin tropopoimeni methodo euler 1d
        d2_dtonos = (Kp2 * (d2_des - d2(i)) - Kd2 * d2_tonos(i) - m2 * g) / m2;

        % enimerosi taxititas kai thesis
        d2_tonos(i+1) = d2_tonos(i) + h * d2_dtonos;
        d2(i+1) = d2(i) + h * d2_tonos(i);
    end

    %Grafikes gia Erotima 1 S
    figure;

    % Grafiki d2(t)
    subplot(2, 1, 1);
    plot(t, d2,'b','LineWidth', 1);
    xlabel('t (s)'); ylabel('d_2 (m)');
    title(['Metatopisi: h = ', num2str(h)]);
    grid on;

    % Grafiki d2'(t)
    subplot(2, 1, 2);
    plot(t, d2_tonos,'r', 'LineWidth', 1);
    xlabel('t (s)'); ylabel("d'_2 (m/s)");
    title(['Taxitita: h = ', num2str(h)]);
    grid on;
end

