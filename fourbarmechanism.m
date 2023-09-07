%Declare variables

rax=[];
ray=[];

arx=[];
ary=[];

abx=[];
aby=[];

bax=[];
bay=[];

bcx=[];
bcy=[];

cbx=[];
cby=[];

crx=[];
cry=[];

rcx=[];
rcy=[];

rat=[];

alpha=[];

beta=[];

%constraints

arx=rax;
ary=ray;

abx=bax;
aby=bay;

bcx=cbx;
bcy=cby;

crx=rcx;
cry=rcy;

rx=[];
ax=[];
c=[];


%link lengths

a = 5;  %r-a
b = 10; %a-b
c = 10; %b-c
d = 10; %c-d




%crank point O4
rax = 0;
ray = 0;

%gorund

rax = 0;
ray = 0;

abx=10;
aby=0;


i=[];

%angles

t=[];

%x0=10;
%y0=10;
%width=550;
%height=400
%set(gcf,'position',[x0,y0,width,height])
 
%xlabel('real axis');    %Give the xlabel
%ylabel('imag axis');    %Give the ylabel
%title('Example 1');     %Give the title of the plot
%axis([-300 300 -300 300]);
%grid on                 %Display grid on plot
    z=13
figure()
% axis([-5 5 5 -5])
for t=0:0.01:2*pi
     
    i=i+1;
    
    rcx= a*cos(t);
    rcy= a*sin(t);
    
    
    E=(a^2+b^2-2*a*b*cos(t))^(0.5);
    
    alpha = asin( (a/E) * sin(t));
    
    beta = acos ((-(d^2)+(c^2)+(E^2))/(2*c*E));
    
    gaama=pi-( alpha + beta)
    
    
    bcx= b + c*cos(gaama)
    bcy= c*sin(gaama)
    
        plot([z+5 z+5], [z+5 z+5],'k','linewidth',2);hold on
        plot([z+5 z+5], [-z+5 -z+5],'k','linewidth',2);hold on
        plot([-z+5 -z+5], [z+5 z+5],'k','linewidth',2);hold on
        plot([-z+5 -z+5], [-z+5 -z+5],'k','linewidth',2);hold on
      %axis([-900 600 -900 600]);
      plot([rax abx], [ray aby],'b','linewidth', 2); hold on 
      plot([rax rcx], [ray rcy],'r','linewidth', 2); hold on 
      plot([abx bcx], [aby bcy],'g','linewidth', 2); hold on 
      plot([rcx bcx], [rcy bcy],'g','linewidth', 2); hold on 
      hold off
      hold off
      hold off
      hold off
      hold off
      hold off
      hold off
      hold off
      
      frame=getframe;     
end
    %axis([-300 300 -300 300]);
    %grid on                 %Display grid on plot
   

movie(frame)
