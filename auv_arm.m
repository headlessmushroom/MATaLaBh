%time
t = linspace(0,pi/2,100);
t(101:200) = linspace(pi/2,0,100);

%ground
b = 500;

abx = 0;
aby = 0;

bbx = 500;
bby = 0;

%crank
a = 250;

acx = a*cos(t);
acy = -a*sin(t) ;

%arm support
c = 500;

bcx = 2*a*cos(t);
bcy = 0;

ex = 0;
ey = - 2*a*sin(t);

i=1;

t
length(t)
V_e(1,1:200) = zeros;
A_e(1,1:200) = zeros;

for k = 1:length(t)
    %clearing the frame
    clf
    
    t_k =t(k);
    
    %crank
    acx_k = acx(k);
    acy_k = acy(k);
    
    %arm support 
    bcx_k = bcx(k);
    bcy_k = 0;
    
    ex_k = 0;
    ey_k = ey(k);
    
%     %points
%     plot(abx,aby,'*', 'MarkerFaceColor','b', 'MarkerEdgeColor','r','MarkerSize',6); hold on
%     plot(acx_k,acy_k,'o','MarkerFaceColor','b','MarkerEdgeColor','r','MarkerSize',6); hold on
%     plot(bcx_k,bcy_k,'o','MarkerFaceColor','b','MarkerEdgeColor','r','MarkerSize',6); hold on
%     plot(ex_k,ey_k,'o','MarkerFaceColor','b','MarkerEdgeColor','r','MarkerSize',6); hold on
%     
%     % location of lines
%     
%     plot([abx,acx_k],[aby,acy_k],'c','linewidth',1) 
%     hold on
%    
%     plot([ex_k,bcx_k],[ey_k,bcy_k],'m','linewidth',2) 
%     hold on
%     
%     plot([ex_k,acx_k],[ey_k,acy_k],'y','linewidth',2) 
%     hold on
%     
%     plot([abx,bbx],[aby,bby],'k','linewidth',1) 
%     hold on
%    


    grid on
%     ylim([-510,10])
%     xlim([-10,510])
%     
    
%    pause(0.1)
    
    
    %velocity analysis
    
    %velocity of EE
    V_e(k) = ey_k/t_k ;
    A_e(k) = V_e(k)/t_k ;
    
    
    
%     movie_vector(i)= getframe;
%     i=i+1;    

    
end
V_e;

nexttile
plot(t,V_e)

nexttile
plot(t,A_e)




% % defining the movie
% movie_variable= VideoWriter('AUV_ARM');
% movie_variable.FrameRate = 30;
% % opening the movie
% open(movie_variable);
% writeVideo(movie_variable, movie_vector);
% close(movie_variable);
%     
%     

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    