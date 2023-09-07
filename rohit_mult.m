function [C] = my_matrix_mult(a11,a12,a13,a21,a22,a23,a31,a32,a33,b11,b12,b13,b21,b22,b23,b31,b32,b33)

A = [a11 a12 a13; a21 a22 a23; a31 a32 a33]
B = [b11 b12 b13; b21 b22 b23; b31 b32 b33]

[m n]=size(A)
[k l]=size(B)

if(n~=k)
    C=[];
    disp('Error, not able to multiply matrices');
    return;
elseif isempty(A) || isempty(B)
    C=[];
    return;
end

C=zeros(m,l);
for i=1:m;
    for j=1:l;
        for p=1:n;
            C(i,j)=C(i,j)+ A(i,p)*B(p,j);
        end            
    end
end
end