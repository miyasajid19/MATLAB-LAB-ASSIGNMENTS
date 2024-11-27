clc;
A = [
    5, 5, 0, 0, 0, 5.5;
    0, 0, 1, -1, -1, 0;
    0, 0, 0, 2, -3, 0;
    0, 5, -7, -2, 0, 0;
    1, -2, -1, 0, 0, 0;
];

%forward elimination
[n,m]=size(A);
for i=1:n
    if(A(i,i)==0)
        for j=i+1:n
            if(A(j,i)~=0)
                A([i,j],:)=A([j,i],:);
                disp("swap")
                break;
            end
        end
    end
    if(A(i,i)==0)
        error("matrix is singular or near singular");
    end
    %eliminating forward
    for j=1:n-1
        m=A(i,j)/A(i,i);
        A(j,:)=A(j,:)-m*(A(i,:));
    end
end

if(A(n,n)==0)
    error("infinite solution");
end

%backward substitution
x=zeros(n,1);
x(n)=A(n,end)/A(n,n);
for i=n-1:-1:1
    sum=0;
    for j=i+1:n
        sum=sum+A(i,j)*x(j);
    end
    x(i)=(A(i,end)-sum)/A(i,i);
end
x