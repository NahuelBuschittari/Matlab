%% Problema servo

num=[18];
den=[1 2 26];
FTLC=tf(num,den);

figure(1);
hold on;
step(FTLC);
t=(-1:0.01:10); %Tiempo de -1 a 10 con un incremento de 0.01
unitstep = t>=0;
plot(t,unitstep, 'r')
title('Respuesta a una entrada escalon - problema SERVO')
xlabel('Tiempo')
ylabel('Amplitud')
legend('C(t)','Entrada escalon')
xlim([-1 7]);
ylim([0 1.5]);