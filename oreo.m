function  inputs(q1,q2,q3,q4,q5)

c = [0;0;1];

t1=q1;
Z1=3;
x1=0;
p1=-pi/2;

t2=q2-pi/2;
z2=0;
x2=5.75;
p2=0;

t3=q3+pi/2;
z3=-0.14;
x3=0;
p3=pi/2;

t4=q4-pi/2;
z4=0;
x4=0;
p4=-pi/2;

t5=q5;
z5=4.125;
x5=0;
p5=0;


j1 = [t1,Z1,x1,p1]' ;
j2 = [t2,z2,x2,p2]' ;
j3 = [t3,z3,x3,p3]' ;
j4 = [t4,z4,x4,p4]' ;
j5 = [t5,z5,x5,p5]' ;


Transformation_1_theta = eye(4);
Transformation_1_zdist = eye(4);
Transformation_1_xdist = eye(4);
Transformation_1_phi = eye(4);

Transformation_2_theta = eye(4);
Transformation_2_zdist = eye(4);
Transformation_2_xdist = eye(4);
Transformation_2_phi = eye(4);

Transformation_3_theta = eye(4);
Transformation_3_zdist = eye(4);
Transformation_3_xdist = eye(4);
Transformation_3_phi = eye(4);

Transformation_4_theta = eye(4);
Transformation_4_zdist = eye(4);
Transformation_4_xdist = eye(4);
Transformation_4_phi = eye(4);

Transformation_5_theta = eye(4);
Transformation_5_zdist = eye(4);
Transformation_5_xdist = eye(4);
Transformation_5_phi = eye(4);

Transformation_1_theta(1:2,1:2) = [cos(t1), -sin(t1);sin(t1) cos(t1)];
Transformation_2_theta(1:2,1:2) = [cos(t2), -sin(t2);sin(t2) cos(t2)];
Transformation_3_theta(1:2,1:2) = [cos(t3), -sin(t3);sin(t3) cos(t3)];
Transformation_4_theta(1:2,1:2) = [cos(t4), -sin(t4);sin(t4) cos(t4)];
Transformation_5_theta(1:2,1:2) = [cos(t5), -sin(t5);sin(t5) cos(t5)];

Transformation_1_zdist(3,4) = Z1;
Transformation_2_zdist(3,4) = z2;
Transformation_3_zdist(3,4) = z3;
Transformation_4_zdist = z4;
Transformation_5_zdist(3,4) = z5;

Transformation_1_xdist(1,4) = x1;
Transformation_2_zdist(1,4) = x2;
Transformation_3_zdist(1,4) = x3;
Transformation_4_xdist(1,4) = x4;
Transformation_5_xdist(1,4) = x5;

Transformation_1_phi(2:3,2:3) = [cos(p1),-sin(p1);sin(p1) cos(p1)];
Transformation_2_phi(2:3,2:3) = [cos(p2),-sin(p2);sin(p2) cos(p2)];
Transformation_3_phi(2:3,2:3) = [cos(p3),-sin(p3);sin(p3) cos(p3)];
Transformation_4_phi(2:3,2:3) = [cos(p4),-sin(p4);sin(p4) cos(p4)];
Transformation_5_phi(2:3,2:3) = [cos(p5),-sin(p5);sin(p5) cos(p5)];

T01 = [[[Transformation_1_theta * Transformation_1_zdist] * Transformation_1_xdist ]*Transformation_1_phi ];
T12 = [[[Transformation_2_theta * Transformation_2_zdist] * Transformation_2_xdist ]*Transformation_2_phi ];
T23 = [[[Transformation_3_theta * Transformation_3_zdist] * Transformation_3_xdist ]*Transformation_3_phi ];
T34 = [[[Transformation_4_theta * Transformation_4_zdist] * Transformation_4_xdist ]*Transformation_4_phi ];
T45 = [[[Transformation_5_theta * Transformation_5_zdist] * Transformation_5_xdist ]*Transformation_5_phi ];

T00 = zeros(4);
T01 = T01;
T02 = T01*T12;
T03 = T01*T12*T23;
T04 = T01*T12*T23*T34;
T05 = T01*T12*T23*T34*T45;

r00 = zeros(3,3);
r01 = T01(1:3,1:3);
r02 = T12(1:3,1:3);
r03 = T23(1:3,1:3);
r04 = T34(1:3,1:3);
r05 = T45(1:3,1:3);

d00 = zeros(3,1);
d01 = T01(1:3,4);
d02 = T02(1:3,4);
d03 = T03(1:3,4);
d04 = T04(1:3,4);
d05 = T05(1:3,4);

J1= T00(1:3,4)
J2= T02(1:3,4)
J3= T03(1:3,4)
J4= T04(1:3,4)
J5= T05(1:3,4)

FK = [[[[[T01*T12]*T23]*T34]*T45]]

IFK = inv(FK)
 
J(1:3,1) = cross(r00*c,(d05 - d00));
J(1:3,2) = cross(r01*c,(d05 - d00));
J(1:3,3) = cross(r02*c,(d05 - d00));
J(1:3,4) = cross(r03*c,(d05 - d00));
J(1:3,5) = cross(r04*c,(d05 - d00));
J(1:3,6) = cross(r05*c,(d05 - d00));

J(4:6,1) = r00*c;
J(4:6,2) = r01*c;
J(4:6,3) = r02*c;
J(4:6,4) = r03*c;
J(4:6,5) = r04*c;
J(4:6,6) = r05*c

end