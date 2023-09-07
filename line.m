i=1;
for t=1:0.1:10
    y=sin(t);
    t1=1:0.1:10;
    y1=sin(t1);
    plot(t1,y1,t,y,'o','MarkerSize',20,'MarkerFaceColor','k');
    
%     ylim([-2,2]);
    anime(i)=getframe;
    i=i+1;
end
    