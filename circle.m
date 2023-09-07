% function [] = circle(r)
% video = VideoWriter('circles.avi');
% open(video)

figure
axis equal 
axis( [-10 10 -9 9]);
grid on 



r=4
% alpha(1,1) =0;

% 
% radius = line('LineWidth',2,'color','k');

t=linspace(0,2*pi,200);
Ya = r*cos(t);
Xa = r*sin(t);
    
i=1
for k=1:length(t)
    
    %clearing frame
    clf
    
    
%     alpha(i(k,1),1) = 
    
    t_k = t(k);
    y_k = Ya(k);
    x_k = Xa(k);
    
    Yo(k) = 0;
    Xo(k) = 0;
    
     
    % location of the point
    
    plot([Xo,x_k],[Yo,y_k],'g','linewidth',10) 
    hold on
    plot(x_k,y_k,'go','MarkerSize',10)
    hold on 
    
   % entire trajectory
    plot(Xa,Ya,'b-','linewidth',2)
    
    %decoratign the plot 
    grid on 
    xlabel('ex')
    ylabel('why')
%     
%     pause(0.01)
%     frame(i)=getframe;
%     writeVideo(video,frame(i));
%     i=i+1;
% 
    cricle_movie_vector(i)=getframe;
    i=i+1
    
       
end

   %save the movie
movie_variable = VideoWriter('circlez');
movie_variable.FrameRate = 30;


%open the movie 
open(movie_variable);
writeVideo(movie_variable, cricle_movie_vector);
close(movie_variable);



