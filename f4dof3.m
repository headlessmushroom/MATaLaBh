function f4dof_5(q1,q2,q3,q4)

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


i=0;


while i<=4*n
    if i<n
        for ka=1:length(t1)
 
    %transformation joint a
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
 
    elseif i >=n && i<2*n
    
        for kb=1:length(t2)

         %tranformation joint b 
         T12_theta(:,:,kb) = eye(4);
         T12_d(:,:,kb) = eye(4);
         T12_x(:,:,kb) = eye(4);
         T12_alpha(:,:,kb) = eye(4);

         T12_theta(1:2,1:2,kb) = [cos(t2(kb)) -sin(t2(kb)); sin(t2(kb)) cos(t2(kb))];
         T12_d(3,4,kb) = d2;
         T12_x(1,4,kb) = x2;
         T12_alpha(2:3,2:3,kb) = [cos(alpha2) -sin(alpha2); sin(alpha2) cos(alpha2)];

          T12(:,:,kb) = T12_theta(:,:,kb)*T12_d(:,:,kb)*T12_x(:,:,kb)*T12_alpha(:,:,kb);
          
          i=i+1;
        end
        

    elseif i>=2*n && i<3*n
       
        for kc = 1:length(t3)
            
         %tranformation joint c 
         T23_theta(:,:,kc) = eye(4);
         T23_d(:,:,kc) = eye(4);
         T23_x(:,:,kc) = eye(4);
         T23_alpha(:,:,kc) = eye(4);

         T23_theta(1:2,1:2,kc) = [cos(t3(kc)) -sin(t3(kc)); sin(t3(kc)) cos(t3(kc))];
         T23_d(3,4,kc) = d3;
         T23_x(1,4,kc) = x3;
         T23_alpha(2:3,2:3,kc) = [cos(alpha3) -sin(alpha3); sin(alpha3) cos(alpha3)];

          T23(:,:,kc) = T23_theta(:,:,kc)*T23_d(:,:,kc)*T23_x(:,:,kc)*T23_alpha(:,:,kc);
          
          i=i+1;
         end
 
    elseif  i>=3*n
         for kd = 1:length(t4)
         %tranformation joint d
         T34_theta(:,:,kd) = eye(4);
         T34_d(:,:,kd) = eye(4);
         T34_x(:,:,kd) = eye(4);
         T34_alpha(:,:,kd) = eye(4);

         T34_theta(1:2,1:2,kd) = [cos(t4(kd)) -sin(t4(kd)); sin(t4(kd)) cos(t4(kd))];
         T34_d(3,4,kd) = d4;
         T34_x(1,4,kd) = x4;
         T34_alpha(2:3,2:3,kd) = [cos(alpha4) -sin(alpha4); sin(alpha4) cos(alpha4)];

          T34(:,:,kd) = T34_theta(:,:,kd)*T34_d(:,:,kd)*T34_x(:,:,kd)*T34_alpha(:,:,kd);

          i=i+1;

          % line plost fot all joints
            end

    end
end


T01
% T12
% T23
% T34
