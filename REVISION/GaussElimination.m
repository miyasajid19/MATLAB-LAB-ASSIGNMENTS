clc;
A = [pi, 2^(1/2), -1, 1, 0;
     exp(1), -1, 1, 2, 1;
     1, 1,-1*3^(1/2),1, 2;
     -1, -1, 1, -1*5^(1/2), 3];
[n,m]=size(A);
for i=1:n-1
    if(A(i,i)==0)
        for k=i+1:n
            if( A(k,i)~=0)
                A([k,i],:)=A([i,k],:);
                disp("swapped")
                break;
            end
        end
    end
    if(A(n,n)==0)
        error("matrix is nearly singular or singular");
    end
    %forward elimination
    for j = i+1:n
        m = A(j,i) / A(i,i);
        A(j,:) = A(j,:) - m * A(i,:);
    end
end

if(A(n,n)==0)
    error("matrix is nearly singular or singular");
end

x=zeros(n,1);
x(n)=A(n,n);
%backward subsitution
for i=n-1:-1:1
    sum=0;
    for j=i+1:n
        sum=sum+A(i,j)*x(j);
    end
    x(i)=(A(i,end)-sum)/A(i,i);
end
x