%% codigo en matlab TPI integrador

%% Respuesta a una entrada de prueba sin acción de control FTLA
num=[1];
den=[16 1];
FTLA=tf(num,den)
figure(1)
step(FTLA*24)
hold on
ylim auto
title('Respuesta ante una entrada escalón sin acción de control')
legend('Respuesta','Entrada Escalón')
stepinfo(FTLA*24);
%% Respuesta a una entrada de prueba sin acción de control FTLC
num=[1];
den=[16 1];
k=1;
FTLA=tf(num,den)
Gc=k;
FTLC=feedback(FTLA*Gc,1)
figure(1)
step(FTLC*24)
hold on
t=(0:0.01:40); %tiempo
unistep = t>=0;
plot(t,unistep*24,'r')
ylim auto;
title('Respuesta ante una entrada escalón sin acción de control')
legend('Respuesta','Entrada Escalón')
stepinfo(FTLC*24)

%% Respuesta ante una entrada escalon con retardo de transporte FTLA
num=[1];
den=[16 1];
k=1;
FTLA=tf(num,den,'inputdelay',3)
figure(1)
step(FTLA*24)
hold on
t=(0:0.01:40);
ylim auto;
title('Respuesta ante una entrada escalón con retardo de transporte')
legend('Respuesta','Entrada Escalón')
stepinfo(FTLA)

%% Respuesta ante una entrada escalon con retardo de transporte FTLC
num=[1];
den=[16 1];
k=1;
Gp=tf(num,den)
[numR,denR]=pade(3,1)
R=tf(numR,denR)
FTLA= Gp*R
Gc=k;
FTLC=feedback(FTLA*Gc,1)
figure(1)
step(FTLC*24)
hold on
t=(0:0.01:60);
unistep = t>=0;
plot(t,unistep*24,'r')
ylim ([0 25]);
xlim ([0 60]);
title('Respuesta ante una entrada escalón con retardo de transporte')
legend('Respuesta','Entrada Escalón')
stepinfo(FTLC*24)

%% Respuesta ante una entrada escalón con controlador Proporcional
num=[1];
den=[16 1];
k=2;
Gp=tf(num,den)
% Definimos retardo de transporte
[numR,denR]=pade(3,1)
R=tf(numR,denR)
FTLA= Gp*R
Gc=tf(k);
FTLC=feedback(FTLA*Gc,1)
figure(1)
step(FTLC*24)
hold on
t=(0:0.01:200000);
unistep= t>=0;
plot(t,unistep*24,'r')
ylim ([0 30]);
%xlim auto;
xlim ([0 100]);
title('Respuesta ante una entrada escalón con controlador Proporcional')
legend('Respuesta','Entrada Escalón')
stepinfo(FTLC*24)


%% Respuesta ante una entrada escalón con controlador PI
num=[1];
den=[16 1];
Kp=2;
Ti=3;
Ki=Kp/Ti
Gc =tf([Kp Ki],[1 0])
Gp=tf(num,den)
[numR,denR]=pade(3,1) %Retardo de transporte
R=tf(numR,denR)
FTLA= Gp*R %FT a lazo abierto con retardo
FTLC=feedback(FTLA*Gc,1) %FT lazo cerrado con retardo
figure(1)
step(FTLC*24) % Escalón de amplitud 24
hold on
t=(0:0.01:200000); %tiempo
unistep= t>=0;
plot(t,unistep*24,'r')
ylim ([0 60]);
xlim ([0 200]);
title('Respuesta ante una entrada escalón con controlador PI')
legend('Respuesta','Entrada Escalón')
stepinfo(FTLC*24)


%% Respuesta ante una entrada escalón con controlador PD
num=[1];
den=[16 1];
Kp=2;
Td=0.5;
Kd=Kp*Td;
Gc =tf([Kd Kp],[1]) %FT del controlador
Gp=tf(num,den) %FT de la planta sin retardo
% Retardo de transporte
[numR,denR]=pade(3,1);
R=tf(numR,denR);
FTLA= Gp*R %FT a lazo abierto con retardo
FTLC=feedback(FTLA*Gc,1) %FT lazo cerrado con retardo
figure(1)
step(FTLC*24) %escalon amplitud = 24
hold on
t=(0:0.01:200000); %tiempo
unistep= t>=0;
plot(t,unistep*24,'r')
ylim ([0 30]);
%xlim auto;
xlim ([0 150]);
title('Respuesta ante una entrada escalón con controlador PD')
legend('Respuesta','Entrada Escalón')
stepinfo(FTLC*24)

%% Respuesta ante una entrada escalón con controlador PID
num=[1];
den=[16 1];
Kp=2;
Ti=3;
Ki=Kp/Ti
Td=0.5;
Kd=Kp*Td;
Gc =tf([Kd Kp Ki],[1 0]) %FT del controlador
Gp=tf(num,den)
[numR,denR]=pade(3,1) %Retardo de transporte
R=tf(numR,denR)
FTLA= Gp*R %FT a lazo abierto con retardo
FTLC=feedback(FTLA*Gc,1) %FT lazo cerrado con retardo
figure(1)
step(FTLC*24) % Escalón de amplitud 24
hold on
t=(0:0.01:200000); %tiempo
unistep= t>=0;
plot(t,unistep*24,'r')
ylim ([0 60]);
xlim ([0 200]);
title('Respuesta ante una entrada escalón con controlador PID')
legend('Respuesta','Entrada Escalón')
stepinfo(FTLC*24)


%% Sintonizacion - Metodo de la curva de reaccion
num=[1]
den=[16 1]
Gp= tf(num,den);
[numR,denR]=pade(3,1);
R=tf(numR,denR);
rlocus(Gp*R)
figure(1)
axis([-2 2 -2 2])
[kcr,polos] = rlocfind(Gp*R) % buscamos el k y los polos que me hacen el sist
wm=max(imag(polos)) % omegade la parte imaginaria
Pcr = 2*pi/wm % calculamos el periodo critico
kp=0.6*kcr;
kd=kp*0.125*Pcr;
ki=kp/(0.5*Pcr);
Gc=tf([kd kp ki],[1 0]); %FT del controlador
FTLC=feedback(Gc*Gp*R,1);
figure(3)
step(FTLC*24)

%% Sintonizacion ante una entrada escalón con controlador PID
num=[1];
den=[16 1];
Kp=7.0402;
Ti=4.3131;
Ki=Kp/Ti
Td=1.0783;
Kd=Kp*Td;
Gc =tf([Kd Kp Ki],[1 0]) %FT del controlador
Gp=tf(num,den)
[numR,denR]=pade(3,1) %Retardo de transporte
R=tf(numR,denR)
FTLA= Gp*R %FT a lazo abierto con retardo
FTLC=feedback(FTLA*Gc,1) %FT lazo cerrado con retardo
figure(1)
step(FTLC*24) % Escalón de amplitud 24
hold on
t=(0:0.01:200000); %tiempo
unistep= t>=0;
plot(t,unistep*24,'r')
ylim ([0 60]);
xlim ([0 200]);
title('Respuesta ante una entrada escalón con controlador PID')
legend('Respuesta','Entrada Escalón')
stepinfo(FTLC*24)

%%
num = [1];
den = [16 1];
Gp= tf(num, den)
[numR, denR] = pade(3,1)
R = tf(numR, denR)
Kp=7.0402;
Ti=4.3131;
Ki=Kp/Ti
Td=1.0783;
Kd=Kp*Td;
Gc=tf([Kd Kp Ki], [1 0]);
FTLA= Gp*R*Gc
figure(1)
rlocus(FTLA)
title('Root Locus FT Lazo Abierto Con Controlador PID')
FTLC=feedback(FTLA, 1)
figure(2)
step(FTLC*24)
ylim auto
title('Respuesta ante una entrada escalón con controlador PID')
%% k critico Respuesta ante una entrada escalón con controlador Proporcional
num=[1];
den=[16 1];
k=11.77;
Gp=tf(num,den)
% Definimos retardo de transporte
[numR,denR]=pade(3,1)
R=tf(numR,denR)
FTLA= Gp*R
Gc=tf(k);
FTLC=feedback(FTLA*Gc,1)
figure(1)
step(FTLC*24)
hold on
t=(0:0.01:200000);
unistep= t>=0;
plot(t,unistep*24,'r')
ylim ([0 30]);
%xlim auto;
xlim ([0 100]);
title('Respuesta ante una entrada escalón con controlador Proporcional')
legend('Respuesta','Entrada Escalón')
stepinfo(FTLC*24)

%% PD
clc
num = [1];
den = [16 1];
Gp= tf(num, den)
[numR, denR] = pade(3,1)
R = tf(numR, denR)
Gp = Gp*R;
Td= 0.5;
Kp= 3.5;
Kd = Kp*Td;
Gc=tf([Kd Kp], [1]);
figure(1)
FTLA= Gp*Gc
rlocus(FTLA)
title('Root Locus FT Lazo Abierto Con Controlador Proporcional derivativo')
Kp1 = Kp;
Td1= 0.001;
Kd1= Kp1*Td1;
Gc = tf([Kd1 Kp1],[1]);
FTLC1=feedback(Gp*Gc, 1)
figure(2)
step(FTLC1*24)
ylim([0 50])
title('Respuesta ante una entrada escalon con controlador PD')
legend('Td = 0.001 k=3.5')
Kp2 = Kp;
Td2= 0.5;
Kd2= Kp2*Td2;
Gc = tf([Kd2 Kp2],[1]);
FTLC2=feedback(Gp*Gc, 1)
figure(3)
step(FTLC2*24)
ylim([0 30 ])
title('Respuesta ante una entrada Escalon con controlador PD')
legend('Td2 =0.5 k=3.5')
Kp3 = Kp;
Td3= 1;
Kd3= Kp3*Td3;
Gc = tf([Kd3 Kp3],[1]);
FTLC3=feedback(Gp*Gc, 1)
figure(4)
step(FTLC3*24)
ylim([0 30 ])
title('Respuesta ante una entrada Escalon con controlador PD')
legend('Td3 =1 k=3.5')