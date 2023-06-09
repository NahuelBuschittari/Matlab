%% Control porporcional
clc
z=[''];
p=[-1 -0.5];
[num,den]=zp2tf(z,p,1);
Gp=tf(num,den);

H=[1];
kp=1;

Gc=tf(kp); %Funcion de transferencia del controlador proporcional
FTLA=Gc*Gp;

figure(1);
rlocus(FTLA); %Lugar geometrico
xlim=([-1.5 1]);
ylim=([-3 3]);
title('LGR Control P');

%Salida del sistema en lazo cerrado
kp=0.5;
Gc=tf(kp);
FTLC1=feedback(Gc*Gp,H);

kp=3;
Gc=tf(kp);
FTLC2=feedback(Gc*Gp,H);

kp=5;
Gc=tf(kp);
FTLC3=feedback(Gc*Gp,H);

figure(2);
step(FTLC1,FTLC2,FTLC3);
%Sist de 1er orden: Aumento k, por consecuencia, mas negativo el polo, implicaria un aumento en
%la respuesta del sistema, disminuye el error en estado estable
