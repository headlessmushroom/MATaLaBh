% function cycle = angles(theta, phi)
% variables
%time
t=linspace(0,4*pi,100);

%angles 
theta = pi/2;
phi=pi/2;
xi=pi/2;
si=pi/2;


%joint 0 = left feet 
%joint 1 = left hip 
-
%joint 2 = right hip 
%joint 3 = right feet
%endfactor 4 = right feet base
%walking on xz plane y is up.


%left foot 
l = 10; 

% right foot 
r = 10 ;
 
% body
f= 10 ;


%initial coordiantes of joints 

joint1_x_k = 0;
joint1_y_k = 0 ;
joint1_z_k = 0;

joint2_x_k = 0;
joint2_y_k = l;
joint2_z_k = 0;

joint3_x_k = f;
joint3_y_k = r;
joint3_z_k = 0;

joint4_x_k = f;
joint4_y_k = 0;
joint4_z_k = 0;

%rotation about y about joint 1
t_joint0_1 = eye(4);
t_joint0_1(1:3,1:3) = [cos(-theta) 0 -sin(-theta); 0 1 0; sin(-theta), 0 ,cos(-theta)];
t_joint0_1(1:3,4) = [0;0;0]

%rotation about z' at joint 2
t_joint1_2 =eye(4);
t_joint1_2(1:2,1:2) = [cos(-phi) -sin(-phi); sin(-phi) cos(-phi)];
t_joint1_2(1:3,4) = [0;0;r]

%rotaion about z'' at joint 3
t_joint2_3 = eye(4);
t_joint2_3(1:2,1:2) = [cos(phi) -sin(phi); sin(phi) cos(phi)];
t_joint2_3(1:3,4) = [f;0;0];

%rotation about z''' at joint 4
t_joint3_4 = eye(4);
t_joint3_4(1:2,1:2) = [cos(theta) -sin(theta); sin(theta) cos(theta)];
t_joint3_4(1:3,4) = [0;0;-r]

% rotations wrt origin
t01 = t_joint0_1;
t02 = t_joint0_1*t_joint1_2;
t03 = t_joint0_1*t_joint1_2*t_joint2_3;
t04 = t_joint0_1*t_joint1_2*t_joint2_3*t_joint3_4



% %rotation 1 
% bx=r*sin(t);
% by=0
% bz= r*cos(t);
% 
% cx= f*sin(t) - r*sin(t)
% cy=
% cz= r*cos(t) + f*sin(t)
% 
% dx= f*cos(t)
% dy=
% dz= f*sin(t)
% 
% %rotation 2 
% cx
%      