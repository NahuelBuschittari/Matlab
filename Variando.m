%% Variando contenido
%Caso 1er orden 
T1 = 0.1
T2=0.2
num = [1]
den = [T1 1]

G1 = tf(num, den)

num2 = [5]
den2 = [T1 1]

G2 = tf(num2, den2)
impulse(G1,G2)
title("Respuestas al impulso en sistemas de 1er orden")
ylabel("Amplitud")
xlabel("Tiempo")
legend('G1(t),num=1','G1(t),num=5')


%% Entrada senoidal


% Parámetros del sistema
K = 1;      % Ganancia
tau = 1;  % Constante de tiempo

% Entrada senoidal
frecuencia = 0.5;   % Frecuencia de la entrada senoidal
amplitud = 1;       % Amplitud de la entrada senoidal
tiempo_simulacion = 10; % Tiempo de simulación en segundos
t = 0:0.01:tiempo_simulacion; % Vector de tiempo

entrada = amplitud * sin(2*pi*frecuencia*t);

% Respuesta al sistema de primer orden
respuesta = K * (1 - exp(-t/tau)) .* entrada;

% Plot de la respuesta
figure;
plot(t, respuesta);
xlabel('Tiempo');
ylabel('Respuesta');
title('Respuesta a una entrada senoidal de un sistema de primer orden tau=1');

%% 