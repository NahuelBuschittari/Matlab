T1 = 0.1

num = [1]
den = [T1 1]

G1 = tf(num, den)

step(G1)
title("Respuestas al escalon en sistemas de 1er orden")
ylabel("Amplitud")
xlabel("Tiempo")
legend('G1(t), Tau=0.1')