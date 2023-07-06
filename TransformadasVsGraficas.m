num=[1];
den=[1 1];
FTLC=tf(num,den)
ste(FTLC);
%% 
num=[1];
den=[1 2 1 0];
FTLC=tf(num,den)
impulse(FTLC);
rlocus(FTLC)
%%
num=[1];
den=[1 10];
FTLC=tf(num,den)
impulse(FTLC);
%%
num=[10];
den=[1 10];
FTLC=tf(num,den)
impulse(FTLC);
%%
num=[1];
den=[1 0.1 1 0];
FTLC=tf(num,den)
impulse(FTLC);
rlocus(FTLC)
%%
num=[1];
den=[1 1 1 0];
FTLC=tf(num,den)
impulse(FTLC); 
rlocus(FTLC)

%%
k=6
num=[1]
den=[2 1+k]
FTLC=tf(num,den)
step(FTLC)
