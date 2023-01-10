%% 
clc; clear; close all;
%% Testing  myFun
% t = 0:0.1:10;
% xinit = [0, 0, 0, 0];
% Xp = myFun(t,xinit); % 
%% 
xinit = [0.2; 0.3; 0.2; 0.3];
[t,x] = ode45(@myFun,[0,4],xinit);
plot(t,x);