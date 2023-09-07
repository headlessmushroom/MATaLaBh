function[]= animation_4bar_mechanism(r,a,b,c)
mechanism=VideoWriter('motion.avi');

fr
open(mechanism)

figure
axis equal 
axis ([ -100 100 -100 100]);
grid on

%X=Y;
    
A=[];B=[];C=[];D=[];
ab=a;bc=b;cd=c;da=r;

O = zeros(2)

ground = line('linewidth',3,'color','k');
crank = line('linewidth',3,'color','g');
%rocker= line('linewidth',3,'color','g');
%connecting_rod = line('linewidth',3,'colour','r');


g=1


for t = 0:0.1:2*pi
    
    
    
    Ax(g)=0;
    Ay(g)=0;
    
    Bx(g) = a;BY(g) =0;
   % Cx(t) =
    Dx(g) = r*cos(t);
    Dy(g)=r*sin(t);
    
    
    
    set(crank,'xdata',[Dx(g) Ax(g)],'ydata',[Dy(g) Ay(g)]);
    set(ground,'xdata',[Ax(g) Bx(g)],'ydata',[Ay(g) By(g)]);
    
    g=g+1
    
    drawnow()

    currFrame=getframe;
    writeVideo(mechanism,currFrame);
    pause(0.03)
    end

close(mechanism);

end





