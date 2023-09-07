function quaternions(q1,q2,q3,q4)

%left leg %
l= 10 ;
%body 
f=10;
%right leg
r=10;

%vectors of all the joints at the neutral position 

%left ankle
    %left feet 
    %left leg
    
%   rotation about point ankle      
  la  =  cos(q1/2)+ sin(q1/2)(1*i + 0*j + 0*k );
  la' =  cos(q1/2)+ sin(-q1/2)(1*i + 0*j + 0*k );
% position of the ankle in unit quaternion
 pla  =  1 + 0*i + 0*j + 0*k;
fla   = la * pla * la'
    
%left hip 
    %left leg
    %torso
    
 lh =   cos(q2/2) + sin(q2/2)( 0*i + 0*j - 1*k );
 lh' =   cos(q2/2) + sin(-q2/2)( 0*i + 0*j - 1*k );
 
 % position of the hip in unit quaternion
 plh  =  1 + 0*i + 0*j + 0*k;
 
 Flh  = lh* plh * lh'
 
 
  
%right hip
    %right leg
    %torso
    
 rh =    cos(q3/2) + sin(q3/2)( 1*i + 0*j + 1*k );
 rh' =    cos(q3/2) + sin(-q3/2)( 1*i + 0*j + 1*k );
% position of the ankle in unit quaternion
prh  =  1 + 0*i + 0*j + 0*k;
Frh = rh * prh * rh'
 
%right ankle 
    %rigth feet 
    %right leg
    
 ra =   cos(q4/2)+ sin(q4/2)(1*i + 0*j + 0*k );
 ra' =   cos(q4/2)+ sin(-q4/2)(1*i + 0*j + 0*k );
 % position of the ankle in unit quaternion
 pra =  1 + 0*i + 0*j + 0*k;
 Fra = ra * pra * ra'
 
 
 
 
 
 
    
    
    
    
