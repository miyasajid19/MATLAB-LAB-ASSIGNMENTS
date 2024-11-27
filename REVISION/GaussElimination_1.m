clc;
A=[10,8,-3,1,16;
    2,10,1,-4,9;
    3,-4,10,1,10;
    2,2,-3,10,11];
%forward elimination
[n,m]=size(A);
for i=1:n-1
    if(A(i,i)==0)
        for j=i+1:n
            if(A(j,i~=0))
                A([i,j],:)=A([j,i],:);
                break;
            end
        end
    end
    if(A(i,i)==0)
        error("singular or nearly singlar matrix");
    end
    
    %elimation
    for j=i+1:n
        m=A(j,i)/A(i,i);
        A(j,:)=A(j,:)-m*A(i,:);
    end
end
if(A(n,n)==0)
    error("infinite solution");
end
x=zeros(n,1);
x(n)=A(n,end)/A(n,end);
%backward substitution
for j=n-1:-1:1
    sum=0;
    for k=j+1:n
        sum=sum+A(j,k)*x(k);

    end
    x(j)=(A(j,end)-sum)/A(j,j);
end
x