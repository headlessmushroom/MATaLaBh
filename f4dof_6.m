function f4dof_6(q1,q2,q3,q4)

%left leg 
l= 10 ;
%body 
f=10;
%right leg
r=10;

%dh parameters @ NEUTRAL POSITION
%slno   theta     d   x   alpha
%1      q1-pi/2   0   l   -pi/2
%2      q2        0   f   0
%3      q3       -r   0   -pi/2
%4      q4        0   0   0

% resolution of the motion
n=1000;

t1 = linspace(-pi/2,-pi/2+q1,n); 
d1 =  0;
x1 =  l;
alpha1 = -pi/2;  


t2 = linspace(0,q2,n);
d2 = 0; 
x2 = f;
alpha2 = 0;

t3 = linspace(0,q3,n);
d3 =  -r;
x3 =  0;
alpha3 =pi/2;

t4 = linspace(0,q4,n);
d4 = 0;
x4 = 0;
alpha4 = 0;


% 0 = left feet 
% 1 = left hip 
% 2 = right hip 
% 3 = right feet
% 4 = right feet base


%transformation joint a
T01_theta = eye(4);
T01_d = eye(4);
T01_x = eye(4);
T01_alpha = eye(4);
T01= eye(4);

%transformation joint b
T12_theta = eye(4);
T12_d = eye(4);
T12_x = eye(4);
T12_alpha = eye(4);
T12= eye(4);

%transformation joint c
T23_theta = eye(4);
T23_d = eye(4);
T23_x = eye(4);
T23_alpha = eye(4);
T23= eye(4);

%transformation joint d
T34_theta = eye(4);
T34_d = eye(4);
T34_x = eye(4);
T34_alpha = eye(4);
T34= eye(4);



% sequence of functioning joints 
34
01
12
34
23
01


i=0;


while i<=4*n
    if i<n
        for ka=1:length(t1)
            T01_theta(:,:,ka) = eye(4);
            T01_d(:,:,ka) = eye(4);
            T01_x(:,:,ka) = eye(4);
            T01_alpha(:,:,ka) = eye(4);
    
            T01_theta(1:2,1:2,ka) = [cos(t1(ka)) -sin(t1(ka)); sin(t1(ka)) cos(t1(ka))];
            T01_d(3,4,ka) = d1;
            T01_x(1,4,ka) = x1;
            T01_alpha(2:3,2:3,ka) = [cos(alpha1) -sin(alpha1); sin(alpha1) cos(alpha1)];
     
            T01(:,:,ka) = T01_theta(:,:,ka)*T01_d(:,:,ka)*T01_x(:,:,ka)*T01_alpha(:,:,ka);
     
        i=i+1;
    end
 
            
            
            
            
            
 
end


T01
% T12
% T23
% T34
