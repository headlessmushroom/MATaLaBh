function robot = vrbls(q1,q2,q3,q4)

%left leg 
l= 10 ;
%body 
f=10;
%right leg
r=10;
%dh parameters @ NEUTRAL POSITION
dh_parameters = [-pi/2, 0, l, -pi/2; q2, 0, f, 0; q3, -r, 0, pi/2; q4, 0, 0, 0];


t1 = linspace(dh_parameters(1,1),dh_parameters(1,1)+q1,100)

theta1 = t1
d1 = dh_parameters(1,2);
x1 = dh_parameters(1,3);
alpha1 = dh_parameters(1,4);

theta2 = dh_parameters(2,1);
d2 = dh_parameters(2,2);
x2 = dh_parameters(2,3);
alpha2 = dh_parameters(2,4);

theta3 = dh_parameters(3,1);
d3 = dh_parameters(3,2);
x3 = dh_parameters(3,3);
alpha3 = dh_parameters(3,4);

theta4 = dh_parameters(4,1);
d4 = dh_parameters(4,2);
x4 = dh_parameters(4,3);
alpha4 = dh_parameters(4,4);


%joint 0 = left feet 
%joint 1 = left hip 
%joint 2 = right hip 
%joint 3 = right feet
%endfactor 4 = right feet base

T01= eye(4);
T12= eye(4);
T23= eye(4);
T34= eye(4);

%transformation joint a
%theta
T01_theta = eye(4);
T01_d = eye(4);
T01_x = eye(4);
T01_alpha = eye(4);

T01_theta(1:2,1:2) = [cos(theta1) -sin(theta1); sin(theta1) cos(theta1)];
T01_d(3,4) = [d1];
T01_x(1,4) = [x1];
T01_alpha(2:3,2:3) = [cos(alpha1) -sin(alpha1); sin(alpha1) cos(alpha1)];

T01 = T01_theta*T01_d*T01_x*T01_alpha;

%transformation joint b
T02_theta = eye(4);
T02_d = eye(4);
T02_x = eye(4);
T02_alpha = eye(4);

T02_theta(1:2,1:2) = [cos(theta2) -sin(theta2); sin(theta2) cos(theta2)];
T02_d(3,4) = d2;
T02_x(1,4) = x2;
T02_alpha(2:3,2:3) = [cos(alpha2) -sin(alpha2); sin(alpha2) cos(alpha2)];

T02 = T02_theta*T02_d*T02_x*T02_alpha;

%transformation joint c
T03_theta = eye(4);
T03_d = eye(4);
T03_x = eye(4);
T03_alpha = eye(4);

T03_theta(1:2,1:2) = [cos(theta3) -sin(theta3); sin(theta3) cos(theta3)];
T03_d(3,4) = [d3];
T03_x(1,4) = [x3];
T03_alpha(2:3,2:3) = [cos(alpha3) -sin(alpha3); sin(alpha3) cos(alpha3)];

T03 = T03_theta*T03_d*T03_x*T03_alpha;

%transformation joint d
T04_theta = eye(4);
T04_d = eye(4);
T04_x = eye(4);
T04_alpha = eye(4);

T04_theta(1:2,1:2) = [cos(theta4) -sin(theta4); sin(theta4) cos(theta4)];
T04_d(3,4) = [d4];
T04_x(1,4) = [x4];
T04_alpha(2:3,2:3) = [cos(alpha4) -sin(alpha4); sin(alpha4) cos(alpha4)];

T04 = T04_theta*T04_d*T04_x*T04_alpha;


% for k=1:length(t1)
%     
%     
















