function y = boink(theta1,theta2,theta3,theta4,theta5,theta6)

z_distance1=0
z_distance2=0.16
z_distance3=-0.14
z_distance4=0.45
z_distance5=0
z_distance6=0.07

x_distance1=0
x_distance2=-0.4
x_distance3=0
x_distance4=0
x_distance5=0
x_distance6=0

x_rotation1=pi/2
x_rotation2=0
x_rotation3=pi/2
x_rotation4=pi/2
x_rotation5=-pi/2
x_rotation6=0



Transform_1_z_rot      = [cos(theta1), -sin(theta1), 0, 0, ;sin(theta1), cos(theta1), 0, 0;0, 0, 1, 0;0, 0, 0, 1]
Transform_1_z_dist     = [1, 0, 0, 0 ;0, 1, 0, 0;0, 0, 1, z_distance1;0, 0, 0, 1]
Transform_1_x_dist     = [1, 0, 0, x_distance1;0, 1, 0, 0;0, 0, 1, 0;0, 0, 0, 1] 
Transform_1_x_rotation = [1, 0, 0, 0; 0, cos(x_rotation1), -sin(x_rotation1), 0;0, sin(x_rotation1), cos(x_rotation1), 0;0, 0, 0, 1]
Transform_2_z_rot      = [cos(theta2) -sin(theta2) 0 0 ;sin(theta2) cos(theta2) 0 0;0 0 1 0;0 0 0 1]
Transform_2_z_distance = [1 0 0 0 ;0 1 0 0;0 0 1 z_distance2;0 0 0 1]
Transform_2_x_distance = [1 0 0 x_distance2;0 1 0 0;0 0 1 0;0 0 0 1] 
Transform_2_x_rotaion  = [1 0 0 0; 0 cos(x_rotation2) -sin(x_rotation2) 0;0 sin(x_rotation2) cos(x_rotation2) 0;0 0 0 1]
Transform_3_z_rot      = [cos(theta3) -sin(theta3) 0 0 ;sin(theta3) cos(theta3) 0 0;0 0 1 0;0 0 0 1]
Transform_3_z_distance = [1 0 0 0 ;0 1 0 0;0 0 1 z_distance3;0 0 0 1]
Transform_3_x_distance = [1 0 0 x_distance3;0 1 0 0;0 0 1 0;0 0 0 1] 
Transform_3_x_rot      = [1 0 0 0; 0 cos(x_rotation3) -sin(x_rotation3) 0;0 sin(x_rotation3) cos(x_rotation3) 0;0 0 0 1]
Transform_4_z_rot      = [cos(theta4) -sin(theta4) 0 0 ;sin(theta4) cos(theta4) 0 0;0 0 1 0;0 0 0 1]
Transform_4_z_dist     = [1 0 0 0 ;0 1 0 0;0 0 1 z_distance4;0 0 0 1]
Transform_4_x_dist     = [1 0 0 x_distance4;0 1 0 0;0 0 1 0;0 0 0 1]
Transform_4_x_rot      = [1 0 0 0; 0 cos(x_rotation4) -sin(x_rotation4) 0;0 sin(x_rotation4) cos(x_rotation4) 0;0 0 0 1]
Transform_5_z_rot      = [cos(theta5) -sin(theta5) 0 0 ;sin(theta5) cos(theta5) 0 0;0 0 1 0;0 0 0 1]
Transform_5_z_dist     = [1 0 0 0 ;0 1 0 0;0 0 1 z_distance5;0 0 0 1]
Transform_5_x_dist     = [1 0 0 x_distance5;0 1 0 0;0 0 1 0;0 0 0 1] 
Transform_5_x_rot      = [1 0 0 0; 0 cos(x_rotation5) -sin(x_rotation5) 0;0 sin(x_rotation5) cos(x_rotation5) 0;0 0 0 1]
Transform_6_z_rot      = [cos(theta6) -sin(theta6) 0 0 ;sin(theta6) cos(theta6) 0 0;0 0 1 0;0 0 0 1]
Transform_6_z_dist     = [1 0 0 0 ;0 1 0 0;0 0 1 z_distance6;0 0 0 1]
Transform_6_x_dist     = [1 0 0 x_distance6;0 1 0 0;0 0 1 0;0 0 0 1]
Transform_6_x_rot      = [1 0 0 0; 0 cos(x_rotation6) -sin(x_rotation6) 0;0 sin(x_rotation6) cos(x_rotation6) 0;0 0 0 1]


Transform_1 = Transform_1_z_rot*Transform_1_z_dist*Transform_1_x_dist*Transform_1_x_rotation
Transform_2 = Transform_2_z_rot*Transform_2_z_distance*Transform_2_x_distance*Transform_2_x_rotaion
Transform_3 = Transform_3_z_rot*Transform_3_z_distance*Transform_3_x_distance*Transform_3_x_rot
Transform_4 = Transform_4_z_rot*Transform_4_z_dist*Transform_4_x_dist*Transform_4_x_rot
Transform_5 = Transform_5_z_rot*Transform_5_z_dist*Transform_5_x_dist*Transform_5_x_rot
Transform_6 = Transform_6_z_rot*Transform_6_z_dist*Transform_6_x_dist*Transform_6_x_rot

y = Transform_1*Transform_2*Transform_3*Transform_4*Transform_5*Transform_6

end