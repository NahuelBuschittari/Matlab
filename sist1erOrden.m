T1 = 0.1
T2 = 0.2

num = [1]
den = [T1 1]

G1 = tf(num, den)

num2 = [1]
den2 = [T2 1]

G2 = tf(num2, den2)
step(G1,G2)
title("Respuestas al escalon en sistemas de 1er orden")
ylabel("Amplitud")
xlabel("Tiempo")
legend('G1(t), Tau=0.1','G2(t), Tau=0.2')