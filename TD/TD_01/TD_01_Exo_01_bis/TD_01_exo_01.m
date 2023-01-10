% TD 1 : Observation et Commande Non Linéaire
% Trouver une ma trice P qui verifie la condition de Lyapunov pour A1 A2 A3 A4
%%
clc; clear; close all;
%% Linear representation of the non linear systeme
A1 = [0 1; -1.5275 -0.2250];
A2 = [0 1; -1.5275 0];
A3 = [0 1; -0.02 -0.2250];
A4 = [0 1; -0.02 0];
B = [0; 1];

%% LMIedit resolt : 
setlmis([]);
X=lmivar(1,[2 1]);
Y1=lmivar(2,[1 2]);
Y2=lmivar(2,[1 2]);
Y3=lmivar(2,[1 2]);
Y4=lmivar(2,[1 2]);

lmiterm([-1 1 1 X],1,1);                        % LMI #1: X

lmiterm([2 1 1 X],1,A1','s');                   % LMI #2: X*A1'+A1*X
lmiterm([2 1 1 -Y1],.5*1,B','s');               % LMI #2: Y1'*B' (NON SYMMETRIC?)
lmiterm([2 1 1 Y1],.5*B,1,'s');                 % LMI #2: B*Y1 (NON SYMMETRIC?)

lmiterm([3 1 1 X],1,A2','s');                   % LMI #3: X*A2'+A2*X
lmiterm([3 1 1 -Y2],.5*1,B','s');               % LMI #3: Y2'*B' (NON SYMMETRIC?)
lmiterm([3 1 1 Y2],.5*B,1,'s');                 % LMI #3: B*Y2 (NON SYMMETRIC?)

lmiterm([4 1 1 X],1,A3','s');                   % LMI #4: X*A3'+A3*X
lmiterm([4 1 1 -Y3],.5*1,B','s');               % LMI #4: Y3'*B' (NON SYMMETRIC?)
lmiterm([4 1 1 Y3],.5*B,1,'s');                 % LMI #4: B*Y3 (NON SYMMETRIC?)

lmiterm([5 1 1 X],1,A4','s');                   % LMI #5: X*A4'+A4*X
lmiterm([5 1 1 -Y4],.5*1,B','s');               % LMI #5: Y4'*B' (NON SYMMETRIC?)
lmiterm([5 1 1 Y4],.5*B,1,'s');                 % LMI #5: B*Y4 (NON SYMMETRIC?)

Exo01suite=getlmis;

[t,Xp] = feasp(Exo01suite);
X = dec2mat(Exo01suite,Xp, X)

Y1 = dec2mat(Exo01suite, Xp, Y1)
Y2 = dec2mat(Exo01suite, Xp, Y2)
Y3 = dec2mat(Exo01suite, Xp, Y3)
Y4 = dec2mat(Exo01suite, Xp, Y4)

K1 = Y1*inv(X);
K2 = Y2*inv(X);
K3 = Y3*inv(X);
K4 = Y4*inv(X);

eig(A1 + B*K1)
eig(A2 + B*K2)
eig(A3 + B*K3)
eig(A4 + B*K4)
