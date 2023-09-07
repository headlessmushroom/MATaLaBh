function [  ] = anim_4l(Y,Lml,Mml)
vidobj=VideoWriter('pushrcvr.avi')
open(vidobj)
figure
axis equal
axis([-0.5 0.5 -0.05 1.7]);
grid on

X=Y;

% l1=0.3; l2=0.55; l3=0.50; l4=0.8; l5=0.50; l6=0.55;
% Lg1=0.55;Lg2=0.50;Lg3=0.8;Lg4=0.50;Lg5=0.55;
% m1=3; m2=6; m3=30; m4=6; m5=3;
Lg1=Lml(1); Lg2=Lml(2); Lg3=Lml(3); Lg4=Lml(4);
m1=Mml(1); m2=Mml(2); m3=Mml(3); m4=Mml(4);
g=9.81;
m=m1+m2+m3+m4;


phi(:,1)=X(:,3);
phi(:,2)=X(:,3)+X(:,4);
phi(:,3)=X(:,3)+X(:,4)+X(:,5);
phi(:,4)=X(:,3)+X(:,4)+X(:,5)+X(:,6);

dphi(:,1)=X(:,9);
dphi(:,2)=X(:,9)+X(:,10);
dphi(:,3)=X(:,9)+X(:,10)+X(:,11);
dphi(:,4)=X(:,9)+X(:,10)+X(:,11)+X(:,12);

foot  =  line('LineWidth',2,'Color','k');
rlleg = line('LineWidth',2,'Color','k');
ruleg = line('LineWidth',2,'Color','b');
trunk = line('LineWidth',2,'Color','r');
% com  =  rectangle('FaceColor',[0 .5 .5]);

k=1;
iteration=text(-0.5,0.5,num2str(k));
for i=1:size(X,1); 
%  size(X,1)  
% xA(i)=0; yA(i)=0;
% xB(i)=l2*cos(phi(i,1))+xA(i);       yB(i)=l2*sin(phi(i,1))+yA(i);
% xC(i)=xB(i)+l3*cos(phi(i,2));       yC(i)=yB(i)+l3*sin(phi(i,2));
% xT(i)=xC(i)+l4*cos(phi(i,3));       yT(i)=yC(i)+l4*sin(phi(i,3));
% xD(i)=xC(i)+l5*cos(2*pi-phi(i,4));  yD(i)=yC(i)-l5*sin(2*pi-phi(i,4));
% xE(i)=xD(i)+l6*cos(2*pi-phi(i,5));  yE(i)=yD(i)-l6*sin(2*pi-phi(i,5));

xA(i)=X(i,1); yA(i)=X(i,2);
xAl(i)=xA(i)-Lg1*cos(X(i,3))/3;                    yAl(i)=yA(i)-Lg1*sin(X(i,3))/3;
xAr(i)=xA(i)+2*Lg1*cos(X(i,3))/3;                  yAr(i)=yA(i)+2*Lg1*sin(X(i,3))/3;
xB(i)=xA(i)+Lg2*cos(X(i,3)+X(i,4));                yB(i)=yA(i)+Lg2*sin(X(i,3)+X(i,4));
xC(i)=xB(i)+Lg3*cos(X(i,3)+X(i,4)+X(i,5));         yC(i)=yB(i)+Lg3*sin(X(i,3)+X(i,4)+X(i,5));
xT(i)=xC(i)+Lg4*cos(X(i,3)+X(i,4)+X(i,5)+X(i,6));  yT(i)=yC(i)+Lg4*sin(X(i,3)+X(i,4)+X(i,5)+X(i,6));

% pm=bc_coords_5link_pv(Y(i,1:5),Y(i,6:10),0,0,Lml,Mml);
% xcom(i)=(m1*pm(1)+m2*pm(4)+m3*pm(7)+m4*pm(10)+m5*pm(13))/m;
% ycom(i)=(m1*pm(2)+m2*pm(5)+m3*pm(8)+m4*pm(11)+m5*pm(14))/m;

r=0.03;
set(foot, 'xdata',[xAl(i) xAr(i)],'ydata',[yAl(i) yAr(i)]);
set(rlleg,'xdata',[xA(i) xB(i)],'ydata',[yA(i) yB(i)]);
set(ruleg,'xdata',[xB(i) xC(i)],'ydata',[yB(i) yC(i)]);
set(trunk,'xdata',[xC(i) xT(i)],'ydata',[yC(i) yT(i)]);
% set(com,'position',[xcom(i)-r,ycom(i)-r,2*r,2*r],'Curvature',[1 1]);
set(iteration,'position',[-0.5,0.5],'string',num2str(i));
drawnow()
currFrame=getframe;
writeVideo(vidobj,currFrame);
pause(0.03)
end
% [yC' xE' yE'  dxE' dyE'];
end

