
Theta_1 = sym('Theta_1')
syms  d_2 Theta_3 Theta_4 Theta_5 l_1 l_2 l_3 l_4 l_5

A1 = [cos(Theta_1) -sin(Theta_1) 0 0; 
      sin(Theta_1) cos(Theta_1)  0 0;
      0          0           1 l_1;
      0          0           0 1];
A2 = [1 0 0  0;
      0 0 -1 0;
      0 1 1  d_2;
      0 0 0  1];
A3 = [cos(Theta_3) 0 -sin(Theta_3) l_3*cos(Theta_3);
      sin(Theta_3) 0  cos(Theta_3) l_3*sin(Theta_3);
      0            -1  0            0;
      0            0   0            1];
A4 = [cos(Theta_4) 0 sin(Theta_4) l_4*cos(Theta_4);
      sin(Theta_4) 0 -cos(Theta_4) l_4*sin(Theta_4);
      0          1 0               0;
      0          0 0               1];
A5 = [cos(Theta_5) -sin(Theta_5) 0 l_5*cos(Theta_5);
      sin(Theta_5)  cos(Theta_5) 0 l_5*sin(Theta_5);
      0           0          1      0;
      0           0          0      1];


T1 = A1
T2 = T1*A2
T3 = T2*A3
T4 = T3*A4
T5 = T4*A5

