%%Criterio de Routh

clc

num=[1];
den=[1 2 3 4 5];
FTLC=tf(num,den)

impulse(FTLC)
xlim([0 10]);
ylim([-2 2]);
title('Respuesta del sistema a una entrada impulso');
ylabel('Amplitud');
xlabel('Tiempo');
legend('C(t)');

figure(2)
pzmap(FTLC);


%% Caso especial 1
clc

num=[1];
den=[1 2 1 2];
FTLC=tf(num,den);

impulse(FTLC)
xlim([0 10]);
ylim([-0.5 0.5]);
title('Respuesta del sistema a una entrada impulso- Caso 1: Criticamente estable');
ylabel('Amplitud');
xlabel('Tiempo');
legend('C(t)');

figure(2)
pzmap(FTLC);

%% Caso especial 2
clc

num=[1];
den=[1 2 24 48 -25 -50];
FTLC=tf(num,den);

impulse(FTLC)
xlim([0 10]);
ylim([0 10]);
title('Respuesta del sistema a una entrada impulso- Caso 2: Inestable');
ylabel('Amplitud');
xlabel('Tiempo');
legend('C(t)');

figure(2)
pzmap(FTLC);