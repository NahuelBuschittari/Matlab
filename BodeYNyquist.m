%% Diagramas de Nyquist
%% k=1
k=1
G1=tf([1],[1 1]);
G2=tf([k],[1 1 1]);
H=tf([1],[1 2]);
FTLA=G1*G2*H;
FTLC=G1*G2/(1+G1*G2*H); % O FTLC=feedblack(G1*G2,H)
figure(1);
rlocus(FTLA);
figure(2);
pzmap(FTLA);
figure(3);
bode(FTLA);
legend('k=1');
figure(4);
nyquist(FTLA);
legend('k=1');
%% k=3.9375
k=3.9375
G1=tf([1],[1 1]);
G2=tf([k],[1 1 1]);
H=tf([1],[1 2]);
FTLA=G1*G2*H;
FTLC=G1*G2/(1+G1*G2*H); % O FTLC=feedblack(G1*G2,H)
figure(1);
rlocus(FTLA);
figure(2);
pzmap(FTLA);
figure(3);
bode(FTLA);
legend('k=3.9375');
figure(4);
nyquist(FTLA);
legend('k=3.9375');

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
legend('k=10');
figure(4);
nyquist(FTLA);
legend('k=10');
%% los 3
k=1
k2=3.9375
k3=10
G1=tf([1],[1 1]);
G2=tf([k],[1 1 1]);
G3=tf([k2],[1 1 1]);
G4=tf([k3],[1 1 1]);
H=tf([1],[1 2]);
FTLA1=G1*G2*H;
FTLC1=G1*G2/(1+G1*G2*H); % O FTLC=feedblack(G1*G2,H)
FTLA2=G1*G3*H;
FTLC2=G1*G3/(1+G1*G3*H);
FTLA3=G1*G4*H;
FTLC3=G1*G4/(1+G1*G4*H);

figure(3);
bode(FTLA1,FTLA2,FTLA3);
legend('k=1','k=3.9375','k=10');
figure(4);
nyquist(FTLA1,FTLA2,FTLA3);
legend('k=1','k=3.9375','k=10');