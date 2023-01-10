%{ 
TD 1 : Observation et Commande Non Linéaire
Verifier que avec les gain Ki trouvés avec ode45
permettre bien de stabiliser le systeme 
on verifier en meme temps pour le système non lineaire et 
les systèmes lineaires equivalents 
%}
function xtp = myFun(t, xt)

x = xt(1:2)
xn = xt(3:4)
% Data
c1 = 0.01; c2 = 0.1; c3 = 0.01; c4 = 0.67; c5 = 0;
M = 1; D = 1;
r1 =  -(c3 + c4*(xn(1))^2 + D*c1)/M; r2 = -D*c2*(xn(2))^2/M;
%
maxZ1 = 3/2; minZ1 = 0;
maxZ2 = 3/2; minZ2 = 0;
%
M1 = 4*(x(1))^2/9; M2 = 1 - M1;
N1 = 4*(x(2))^2/9; N2 = 1 - N1;
%
h1 = M1*N1; h2 = M1*N2; h3 = M2*N1; h4 = M2*N2;
% no linear modele
A = [0 1; r1 r2]; B = [0; 1 + c5*(x(2))^2/M];
% LMI
A1 = [0, 1; -(c3 + c4*(maxZ1)^2 + D*c1)/M, -D*c2*(maxZ2)^2/M];
A2 = [0, 1; -(c3 + c4*(maxZ1)^2 + D*c1)/M, -D*c2*(minZ2)^2/M];
A3 = [0, 1; -(c3 + c4*(minZ1)^2 + D*c1)/M, -D*c2*(maxZ2)^2/M];
A4 = [0, 1; -(c3 + c4*(minZ1)^2 + D*c1)/M, -D*c2*(minZ2)^2/M];

% Les gain des CMD pour les LMI
K1 = [0.0044, -0.9519];
K2 = [0.0044, -1.1769];
K3 = [-1.5031, -0.9519];
K4 = [-1.5031, -1.1769];
% lois de commandes LMI et sys non lineare
uts = (h1*K1 + h2*K2 + h3*K3 + h4*K4)*x;  % CMD pour sys lineaire
un  = (h1*K1 + h2*K2 + h3*K3 + h4*K4)*xn; % CMD pour sys non lineaire
% les sys en BF 
xp = h1*(A1*x + B*uts) + h2*(A2*x + B*uts) + h3*(A3*x + B*uts)+ h4*(A4*x + B*uts);
xpn = A*xn + B*un;
%
xtp = [xp; xpn];
end
