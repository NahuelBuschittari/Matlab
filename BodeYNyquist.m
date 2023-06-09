%% Diagramas de Nyquist
%k=3.9375
k=3.9375
G1=tf([1],[1 1]);
G2=tf([k],[1 1 1]);
H=tf([1],[1 2]);
FTLA=G1*G2*H;
FTLC=G1*G2/(1+G1*G2*H); %O FTLC=feedblack(G1*G2,H)
figure(1);
rlocus(FTLA);
figure(2);
pzmap(FTLA);
figure(3);
bode(FTLA);
figure(4);
nyquist(FTLA);

%% k=10

k=10
G1=tf([1],[1 1]);
G2=tf([k],[1 1 1]);
H=tf([1],[1 2]);
FTLA=G1*G2*H;
FTLC=G1*G2/(1+G1*G2*H); % O FTLC=feedblack(G1*G2,H)
figure(1);
rlocus(FTLA); %No varia el lugar geometrico el variar el k
figure(2);
pzmap(FTLA);
figure(3);
bode(FTLA);
figure(4);
nyquist(FTLA);