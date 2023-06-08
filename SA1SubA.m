%% Sistemas sobreamortiguados

clc %clc borra todo el texto de la ventana de comandos

p1=1;
p2=2;
z='' %Sin ceros

% Sistema de segundo orden1
p=[-p1, -p2]
k=p1*p2;
[num,dem]=zp2tf(z,p,k) %Pasa de ceros y polos a funcion de transferencia(num y denominador)
GSA1=tf(num,dem) 

% Sistema de segundo orden2
p2=50
p=[-p1, -p2]
k=p1*p2;
[num,dem]=zp2tf(z,p,k) %Pasa de ceros y polos a funcion de transferencia(num y denominador)
GSA2=tf(num,dem) 

% Sistema de primer orden
p=[-p1]
k=p1
[num,dem]=zp2tf(z,p,k)
GPO=tf(num,dem)

step(GSA1,GSA2,GPO)

%Si al p2 lo alejamos mucho del eje imaginario, ese polo va a influir cada
%vez menos y se va a parecer a un sist de 1er orden


%% Sistemas subAmortiguados variando parte real
clc %clc borra todo el texto de la ventana de comandos
z='' %Sin ceros
p1=0.2+3i;
p2=0.2-3i;
p=[-p1, -p2]
k=p1*p2;
[num,dem]=zp2tf(z,p,k)
GSubA1=tf(num,dem)

p1=0.8+3i;
p2=0.8-3i;
p=[-p1, -p2]    %Aumento parte real
k=p1*p2;
[num,dem]=zp2tf(z,p,k)
GSubA2=tf(num,dem)

p1=1.7+3i;
p2=1.7-3i;
p=[-p1, -p2]    %Aumento aun mas parte real
k=p1*p2;
[num,dem]=zp2tf(z,p,k)
GSubA3=tf(num,dem)
step(GSubA1,GSubA2,GSubA3)
title('Respuesta al escalon - varia parte real de polos')
ylabel('Amplitud')
xlabel('Tiempo')
legend('CSubA1(t) Sigma=0.2','CSubA2(t) Sigma=0.8','CSubA3(t) Sigma=1.7') 

%Conclusion: Mayor sigma, menos oscila porque el sigma me modifica la
%funcion exponencial la frecuencia es igual para todas
%La exponencial envuelve al seno

%% Sistemas subAmortiguados variando parte imaginaria
clc %clc borra todo el texto de la ventana de comandos
z='' %Sin ceros
p1=1+2i;
p2=1-2i;
p=[-p1, -p2]
k=p1*p2;
[num,dem]=zp2tf(z,p,k)
GSubA1=tf(num,dem)

p1=1+3i;
p2=1-3i;
p=[-p1, -p2]    %Aumento parte imaginaria
k=p1*p2;
[num,dem]=zp2tf(z,p,k)
GSubA2=tf(num,dem)

p1=1+4i;
p2=1-4i;
p=[-p1, -p2]    %Aumento aun mas parte imaginaria
k=p1*p2;
[num,dem]=zp2tf(z,p,k)
GSubA3=tf(num,dem)
step(GSubA1,GSubA2,GSubA3)
title('Respuesta al escalon - varia parte imaginaria de polos')
ylabel('Amplitud')
xlabel('Tiempo')
legend('CSubA1(t) Wd=2','CSubA2(t) Wd=3','CSubA3(t) Wd=4') 

%Conclusion: Cambia la frecuencia de oscilacion

