%8. (Matlab) Analizar en conjunto la respuesta del SSO ante la entrada impulsional, variando ζ y ωd:
% A. -2.5 ±3.5824i
% B. -1.5 ±3.5824i
% C. -0.5 ±3.5824i
% D. -2±3.5i
% E. -2±5i
% F. -2±6.5i


%%Variando parte real
hold on;

z='' %No ceros
k=1;
p=[-2.5+3.5824i, -2.5-3.5824i];
[num,dem]=zp2tf(z,p,k);
G=tf(num,dem);

z='' %No ceros
k=1;
p=[-1.5+3.5824i, -1.5-3.5824i];
[num,dem]=zp2tf(z,p,k);
G2=tf(num,dem);

z='' %No ceros
k=1;
p=[-0.5+3.5824i, -0.5-3.5824i];
[num,dem]=zp2tf(z,p,k);

G3=tf(num,dem);

impulse(G,G2,G3);
title('Rta sist 2do Orden-Entrada impulso -variando z(parte real)')
xlabel('Tiempo');
ylabel('Amplitud');
legend('z=-2.5','z=-1.5','z=-0.5')
hold off;
figure(2);
pzmap(G,G2,G3);

%%
%%Variando parte imaginaria
hold on;

z='' %No ceros
k=1;
p=[-2+3.5i, -2-3.5i];
[num,dem]=zp2tf(z,p,k);
G=tf(num,dem);

z='' %No ceros
k=1;
p=[-2+5i, -2-5i];
[num,dem]=zp2tf(z,p,k);
G2=tf(num,dem);

z='' %No ceros
k=1;
p=[-2+6.5i, -2-6.5i];
[num,dem]=zp2tf(z,p,k);

G3=tf(num,dem);

impulse(G,G2,G3);
title('Rta sist 2do Orden-Entrada impulso -variando wd(parte iamginaria)')
xlabel('Tiempo');
ylabel('Amplitud');
legend('wd=3.5i','wd=5i','wd=6.5i')
hold off;
figure(2);
pzmap(G,G2,G3);