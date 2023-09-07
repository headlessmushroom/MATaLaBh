function FK = Compute_DH( a,b,c,d)

Theta_Transform = [cos(a), -sin(a), 0, 0; sin(a), cos(a), 0, 0; 0, 0, 1, 0; 0, 0, 0, 1]
Z_displacement = [1 0 0 0; 0 1 0 0; 0 0 1 b; 0 0 0 1]
x_displacement = [1 0 0 c; 0 1 0 0; 0 0 1 0; 0 0 0 1]
Alpha_transform = [1, 0, 0, 0;0, cos(d), -sin(d), 0; 0, sin(d), cos(d), 0; 0, 0 ,0, 1]

T_rotx_dispx = x_displacement * Alpha_transform;
T_dispz_dispx_rotX = Z_displacement * T_rotx_dispx;
FK= Theta_Transform * T_dispz_dispx_rotX;


end
