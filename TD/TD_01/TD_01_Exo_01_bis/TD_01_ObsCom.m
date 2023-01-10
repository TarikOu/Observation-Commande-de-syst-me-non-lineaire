%% 
clc; clear; close all;
%% Testing  myFun
% t = 0:0.1:10;
% xinit = [0, 0, 0, 0];
% Xp = myFun(t,xinit); % 
%% 
xinit = [-1; 0.7; -1; 0.7];
[t,x] = ode45(@myFunBis,[0,10],xinit);
% [t,x] = ode45(@myFun,[0,10],xinit); %ode45 (fun, time, initValues)
plot(t,x);