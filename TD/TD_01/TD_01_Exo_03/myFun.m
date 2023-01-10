function Xp = myFun(t,x)

Z1 = x(3)^2;
Z2 = x(4)^2;

M1 = (4/9)*Z1;
M2 = 1 - (4/9)*Z1;

N1 = (4/9)*Z2;
N2 = 1-(4/9)*Z2;

h1 = M1*N1;
h2 = M1*N2;
h3 = M2*N1;
h4 = M2*N2;

A1 = [0 1 ;-1.5275 -0.225];
A2 = [0 1 ;-1.5275 0];
A3 = [0 1 ;-0.02 -0.225];
A4 = [0 1 ; -0.02 0];

B = [0;1];

 % gain
 
K1 = [0.004423076923070 -0.951923076923080];
K2 = [0.004423076923070 -1.176923076923080];
K3 = [-1.503076923076930 -0.951923076923080];
K4 = [-1.503076923076930 -1.176923076923081];

 

X1 = [x(1); x(2)];
u2 = (h1 * K1 + h2 * K2 + h3 * K3 + h4 * K4)*X1;
xp1 = x(2);
xp2 = (-0.02-0.67*x(1)^2)*x(1)+0.1*x(2)^3 + u2;
Xp1 = [xp1; xp2];

X2 = [ x(3) ; x(4)];
u2 = (h1*K1 + h2*K2 + h3*K3 + h4*K4)*X2;
Xp2 = h1*(A1*X2 + B*u2) + h2*(A2*X2 + B*u2) + h3*(A3*X2 + B*u2)+ h4*(A4*X2 + B*u2);

Xp = [Xp1;Xp2];
