% TD 1 : Observation et Commande Non Linéaire
% Trouver une ma trice P qui verifie la condition de Lyapunov pour A1 A2 A3 A4
%%
clc; clear; close all;
%%
A1 = [0 1; -1.5275 -0.2250];
A2 = [0 1; -1.5275 0];
A3 = [0 1; -0.02 -0.2250];
A4 = [0 1; -0.02 0];

setlmis([]);
nP=lmivar(1,[2 1]);
lmiterm([-1 1 1 nP],1,1);         % LMI #1: P
lmiterm([2 1 1 nP],A1',1,'s');    % LMI #2: A1'*P+P*A1
lmiterm([3 1 1 nP],A2',1,'s');    % LMI #3: A2'*P+P*A2
lmiterm([4 1 1 nP],A3',1,'s');    % LMI #4: A3'*P+P*A3
lmiterm([5 1 1 nP],A4',1,'s');    % LMI #5: A4'*P+P*A4

D1_01_ObsCom = getlmis;
[t,Pf] = feasp(D1_01_ObsCom);
P = dec2mat(D1_01_ObsCom,Pf, nP)