%%Ejercicio 7: Determinar para un sistema de segundo orden ante una entrada impulso:
% A. Polos
% B. Mp - (Overshoot)
% C. Ts(2%) - Tiempo de asentamiento
% D. Período de oscilación
% E. Tp - Tiempo Pico máximo
% Para: ζ= 0.1 y ω= 2.
% ζ = 0.7 y ω = 2.
% ζ = 2 y ω = 2.


hold on;
wn= 2;
z=0.1;
num=wn^2;
den=[(1) (2*z*wn) (wn^2)];
G1 =tf(num, den);

wn= 2;
z=1;
num=wn^2;
den=[(1) (2*z*wn) (wn^2)];
G2 =tf(num, den);

wn= 2;
z=2;
num=wn^2;
den=[(1) (2*z*wn) (wn^2)];
G3 =tf(num, den);

impulse(G1,G2,G3); %Entrada impulso
xlabel('Tiempo');
ylabel('Amplitud');
title('Sistemas de segundo orden- entrada impulzo variando Z');
legend('Z=0.1','Z=1','Z=2');

hold off;

figure(2)
pzmap(G1,G2,G3);
legend('Z=0.1','Z=1','Z=2')