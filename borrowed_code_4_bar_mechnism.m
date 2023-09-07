
clear all;
r1=7;r2=4;r3=8;r4=6;
t = 0:5/180:10;
ang_speed = pi/5;
theta2 = ang_speed*t;
theta1 = deg2rad(0);
len = length(theta2)-1;
    
for i=1:length(theta2)
theta2_prime(i) = theta2(i) - theta1;
delta(i) = sqrt(r1^2 + r2^2 -2*r1*r2*cos(theta2_prime(i)));
beta(i) = acos( (r1^2 + delta(i)^2 - r2^2) / (2*r1*delta(i)));
psi(i) = acos( (r3^2 + delta(i)^2 - r4^2) / (2*r3*delta(i)));
lambda(i) = acos( (r4^2 + delta(i)^2 - r3^2) / (2*r4*delta(i)));
if(theta2_prime<=pi)
    theta3(i) = psi(i)-(beta(i)-theta1);
    theta4(i) = pi-lambda(i)-(beta(i)-theta1);
    gamma(i)= acos( (r3^2+r4^2-delta(i)^2) / (2*r3*r4)) - pi/2;
else
    theta3(i) = psi(i)+(beta(i)+theta1);
    theta4(i) = pi-lambda(i)+(beta(i)+theta1);
    gamma(i)= acos( (r3^2+r4^2-delta(i)^2) / (2*r3*r4)) - pi/2;
end
omega4(i) = ang_speed * (r2*(sin(theta3(i)-theta2(i)))) / (r4*(sin(theta3(i)-theta4(i))));
MA(i) = ( r4*sin(theta4(i)-theta3(i)) )/( r2*sin(theta2(i)-theta3(i)) ); %mechanical advantage
Ax(i) = r2*cos(theta2(i));
Ay(i) = r2*sin(theta2(i));
Bx(i) = r2*cos(theta2(i))+r3*cos(theta3(i));
By(i) = r2*sin(theta2(i))+r3*sin(theta3(i));
Box(i) = r1*cos(theta1);
Boy(i) = r1*sin(theta1);
plot([0 Ax(i)], [0 Ay(i)],'ro-','LineWidth',5);hold on; %r2
plot([Ax(i) Bx(i)], [Ay(i) By(i)], 'go-','LineWidth',5); hold on; %r3
plot([Bx(i) Box(i)], [By(i) Boy(i)], 'bo-','LineWidth',5); hold on; %r4
plot([Box(i) 0], [Boy(i) 0], 'co-','LineWidth',5);hold off; %r1
grid on
axis([-15 15 -5 10]);
pause(0.001);
end
subplot(2,1,1)
plot(rad2deg(theta2),rad2deg(theta3));
title(' Coupler angle ')
xlabel('\theta2')
ylabel('\theta3')
grid on
subplot(2,1,2)
plot(rad2deg(theta2),rad2deg(theta4));
title(' Rocker angle ')
xlabel('\theta2')
ylabel('\theta4')
grid on