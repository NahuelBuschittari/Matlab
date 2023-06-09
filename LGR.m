%% Lugar geometrico de las raices

num= [1];
den=[1 2];
FTLA=tf(num,den);
figure(1);
rlocus(FTLA); %Matlab trabaja con FTLA, nosotros con FTLC
%Donde está el polo, es porque el k=0, entonces coincide el polo de la FTLA
%con FTLC, la linea se llama rama, la cual esta compuesta por todos los
%polos cuando k varia de 0 a inf.
%% Variando k
k=3

num=[k]
den=[1 2+k]
FTLC1=tf(num,den)

k=32

num=[k]
den=[1 2+k]
FTLC2=tf(num,den)

k=80

num=[k]
den=[1 2+k]
FTLC3=tf(num,den)

figure(2);
step(FTLC1,FTLC2,FTLC3);
legend('k=3','k=32','k=80');
figure(3);
pzmap(FTLC1,FTLC2,FTLC3);
legend('k=3','k=32','k=80');
%Sist de 1er orden: Aumento k, por consecuencia, mas negativo el polo, implicaria un aumento en
%la respuesta del sistema, disminuye el error en estado estable


%% 

num= [1];
den=[1 1 0];
FTLA=tf(num,den);
figure(1);
rlocus(FTLA);
num=[k]
den=[1 2+k]
FTLC1=tf(num,den)

k=0.05

num=[k]
den=[1 1 k]
FTLC2=tf(num,den)

k=0.25

num=[k]
den=[1 1 k]
FTLC3=tf(num,den)

k=10

num=[k]
den=[1 1 k]
FTLC4=tf(num,den)

figure(2);
step(FTLC2,FTLC3,FTLC4);
xlim([0 30]);
legend('k=0.05','k=0.25','k=10');
figure(3);
pzmap(FTLC2,FTLC3,FTLC4);
legend('k=0.05','k=0.25','k=10');

%%
num=[k]
den=[1 4 8 k]
FTLC1=tf(num,den)

k=0.05

num=[k]
den=[1 4 8 k]
FTLC2=tf(num,den)

k=0.25

num=[k]
den=[1 4 8 k]
FTLC3=tf(num,den)

k=10

num=[k]
den=[1 4 8 k]
FTLC4=tf(num,den)

figure(2);
step(FTLC2,FTLC3,FTLC4);
xlim([0 30]);
legend('k=0.05','k=0.25','k=10');
figure(3);
pzmap(FTLC2,FTLC3,FTLC4);
legend('k=0.05','k=0.25','k=10');