function T1234 = Compute_DH( t,d,x,a)

%"t" is theta, angle made about z axis
%"d" is d,diplacement along Z axis
%"x" is a,displacement along X axis
%"a" is alpha. angel make about x axis

T1 = eye(4);
T1(1:2,1:2) = [cos(t), -sin(t); sin(t), cos(t)];

T2 = eye(4);
T2 (3,4) = d;

T3 = eye(4);
T3(1,4) = x;

T4 = eye(4);
T4(2:3,2:3) = [cos(a), -sin(a); sin(a) cos(a)];


%T34 = T3 * T4;
%T234 = T2 * T34;
%T1234= T1 * T234;

T12 = T1 * T2;
T123 = T12 * T3;
T1234 = T123 * T4;

end
