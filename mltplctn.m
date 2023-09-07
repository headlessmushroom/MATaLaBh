a = randn(3)
b = eye(3)

s_a = size(a);
s_b = size(b);

c = zeros(3);

i=0;
k=0;
for i = 1:s_a(1,2)
    
    for k = 1:s_b(1,1)
        j=1;
        while j <= s_a(1,1)
       
            x = a(i,j)*b(j,k);
            
            c(i,k)=c(i,k)+x;
            j=j+1;
            
        end
    end
end
c

