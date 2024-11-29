x=[0.1,0.2,0.4,0.5,1,2];
y=[21,11,7,6,5,6];
X=0;
Y=0;
XX=0;
XY=0;
for i =1:length(x)
    X=X+x(i);
    Y=Y+y(i);
    XY=XY+x(i)*y(i);
    XX=XX+x(i)*x(i);
end
%arg matrix
A=[length(x),X,Y;X,XX,XY];

%gauss elimination
[n,m]=size(A);
for i=1:n
    if(A(i,i)==0)
        for j=i+1:n
            if(A(j,i)~=0)
                A([i,j],:)=A([j,i],:);
                break;
            end
        end
    end
    if(A(i,i)==0)
        error("singular matrix");
    end

    %elimination
    for j=i+1:n
        m=A(j,i)/A(i,i);
        A(j,:)=A(j,:)-m*A(i,:);
    end
end

if(A(n,n)==0)
    error("infinite soln")
end

x=zeros(n,1);
x(n)=A(n,end)/A(n,n);
for i=n-1:-1:1
    sum=0;
    for j=i+1:n
        sum=sum+A(i,j)*x(j);
    end
    x(i)=A(i,end)/A(i,i);
end
x