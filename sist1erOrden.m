T1 = 0.1
T2 = 0.2

num = [1]
den = [T1 1]

G1 = tf(num, den)

num2 = [1]
den2 = [T2 1]

G2 = tf(num2, den2)
step(G1,G2)
title("Respuestas al escalon en sistemas de 1er orden")
ylabel("Amplitud")
xlabel("Tiempo")
legend('G1(t), Tau=0.1','G2(t), Tau=0.2')
%% 
% Parámetros del sistema

z='' %Sin ceros

% Sistema de segundo orden1
p=-1
k=-p;
[num,dem]=zp2tf(z,p,k) %Pasa de ceros y polos a funcion de transferencia(num y denominador)
G=tf(num,dem)
% Respuesta al escalón
figure;
step(G);
title('Respuesta al escalón');

% Respuesta al impulso
figure;
impulse(G);
title('Respuesta al impulso');
