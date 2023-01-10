%% 
clc; clear; close all;
%% 
xinit = [-1; 0.7; -1; 0.7];
% [t,x] = ode45(@myFunBis,[0,10],xinit);
[t,x] = ode45(@myFun,[0,10],xinit); %ode45 (fun, time, initValues)
plot(t,x);
legend;