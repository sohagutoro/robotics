
Theta_1 = sym('Theta_1')
syms  d_2 Theta_3 Theta_4 Theta_5 l_1 l_2 l_3 l_4 l_5
syms r11 r12 r13 r21 r22 r23 r31 r32 r33 p1 p2 p3
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


T1 = A1;
T2 = T1*A2;
T3 = T2*A3;
T4 = T3*A4;
T5 = T4*A5;

inv_A1 = inv(A1);
inv_A2 = inv(A2);
inv_A3 = inv(A3);
inv_A4 = inv(A4);
inv_A5 = inv(A5);

A1invers = [cos(Theta_1) sin(Theta_1) 0 0;
       -sin(Theta_1) cos(Theta_1) 0 0;
       0 0 1 -l_1;
       0 0 0 1];
A2invers = [1 0 0 0;
        0 0 1 -d_2;
        0 -1 0 0;
        0 0 0 1];
A3invers = [cos(Theta_3) sin(Theta_3) 0 -l_3; 
        0 0 -1 0; 
        -sin(Theta_3) cos(Theta_3) 0 0; 
        0 0 0 1];

A4invers = [cos(Theta_4) sin(Theta_4) 0 -l_4;
        0 0 1 0;
        sin(Theta_4) -cos(Theta_4) 0 0;
        0 0 0 1];
A5invers = [cos(Theta_5) sin(Theta_5) 0 -l_5;
        -sin(Theta_5) cos(Theta_5) 0 0;
        0 0 1 0;
        0 0 0 1];

Theta_p =  [0 0 0 0;
            0 0 0 0;
            0 0 0 1;
            0 0 0 0];

Theta_v =  [0 -1 0 0;
            1 0 0 0;
            0 0 0 0;
            0 0 0 0];

az = [0;
    0;
    1;
    0];
a0 = [0; 
    0; 
    0; 
    1];

U51 = Theta_v * A2 * A3 * A4 * A5
U52 = A1 * Theta_p * A3 * A4 * A5
U53 = A1 *  A2 * Theta_v  * A4 * A5
U54 = A1 *  A2 * A3 * Theta_v  *  A5
U55 = A1 *  A2 * A3 * A4 * Theta_v

J11 = U51 * a0
J12 = U52 * a0
J13 = U53 * a0
J14 = U54 * a0
J15 = U55 * a0

J21 = T1 * az
J22 = 0 * az
J23 = T3 * az
J24 = T4 * az
J25 = T5 * az

J = [J11 J12 J13 J14 J15;
    J21 J22 J23 J24 J25]


T5_star = [r11 r12 r13 p1;
        r21 r22 r23 p2;
        r31 r32 r33 p3;
        0 0 0 1];
left1 = A1invers * T5_star
right1 = A2 * A3 * A4 * A5


left2 = A2invers * T5_star
right2 =  A3 * A4 * A5

left3 = A3invers * T5_star
right3 =  A4 * A5

left4 = A4invers * T5_star
right4 =  A5

left4 = A5invers * T5_star
right4 =  eye(4)




