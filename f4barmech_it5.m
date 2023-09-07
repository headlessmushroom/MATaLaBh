% variables
%time
t=linspace(0,4*pi,100);

%crank 
a = 5;

sx= a*cos(t);
sy= a*sin(t);

%ground
b = 10;

px = 0;
py = 0;

qx=10;
qy=0;

%rocker
c = 10;

d = 10;
%diagnol
E=(a^2+b^2-2*a*b*cos(t)).^(0.5);
    alpha = asin( (a./E) .* sin(t) );
    beta  = acos( (-(d^2) + (c^2) + (E.^2))/(2*c.*E));
    gaama=pi-(alpha + beta);
 rx= b + c*cos(gaama);
 ry = c*sin(gaama);

%coupler
d = 10;

i=1;
% for loop
for k=1:length(t)
    %clearing the frame
    clf
    
    t_k = t(k);
    
    %crank
    sx_k = sx(k);
    sy_k = sy(k);
    
    %ground
    px_k =0;
    py_k =0;
    
    qx_k =10;
    qy_k =0;
    
    %rocker
    
    rx_k= rx(k)
    ry_k= ry(k)

    
   % location of points
   plot(sx_k,sy_k,'o','MarkerFaceColor','b','MarkerEdgeColor','r','MarkerSize',6); hold on
   
   plot(rx_k,ry_k,'o','MarkerFaceColor','b','MarkerEdgeColor','r','MarkerSize',6); hold on
   
   plot(px_k,py_k,'o','MarkerFaceColor','b','MarkerEdgeColor','r','MarkerSize',6); hold on
   
   plot(qx_k,qy_k,'o','MarkerFaceColor','b','MarkerEdgeColor','r','MarkerSize',6); hold on
    

   % location of lines
    
    plot([px_k,qx_k],[py_k,qy_k],'c','linewidth',1) 
    hold on
   
    
    plot([qx_k,rx_k],[qy_k,ry_k],'m','linewidth',1) 
    hold on
    
    plot([rx_k,sx_k],[ry_k,sy_k],'y','linewidth',1) 
    hold on
    
    plot([sx_k,px_k],[sy_k,py_k],'k','linewidth',1) 
    hold on
   
   % location of trajectory
    plot (sx,sy,'r--','LineWidth',2)
    plot (rx,ry,'g-','LineWidth',2)
    
    % pretty graphs
      ylim([-5,15])
      xlim([-5,15])
grid on 
    % encoding
    pause(0.01)
    movie_vector(i)= getframe;
    i=i+1;    
end
% defining the movie
movie_variable= VideoWriter('4bar_mechanism');
movie_variable.FrameRate = 30;
% opening the movie
open(movie_variable);
writeVideo(movie_variable, movie_vector);
close(movie_variable);