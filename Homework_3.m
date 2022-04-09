[~, P_gir] = date_indiv_SS(225)
a1 = 3;
s = tf("s");
Q1 = tf(2+4/(s+1)+1/(s+1)^2);
[X1,Y1,N1,M1] = eucl_Youla(P_gir.num{1},P_gir.den{1},a1);
C1=tf(ss((X1+M1*Q1)/(Y1-N1*Q1),'min'));
T1=tf(ss((P_gir*C1)/(1+P_gir*C1)));
stepinfo(T1);
step(T1);

a2 = 3;
Q2=tf(10.2+6.2/(s+1)+4.1335/(s+1)^2+3.233/(s+1)^6);
[X2,Y2,N2,M2] = eucl_Youla(P_gir.num{1},P_gir.den{1},a2);
evalfr(Q2,0);
evalfr(Y2/N2,0);
C2=tf(ss((X2+M2*Q2)/(Y2-N2*Q2)),'min');
T2=tf(ss((P_gir*C2)/(1+P_gir*C2)));
stepinfo(T2)
step(T2)

save('tema_225.mat', 'a1', 'Q1', 'a2','Q2');