x=[-2,-1,0,1,2];
y=[12,1,1,3,19];
X=0;
Y=0
XX=0;
XY=0;
for i=1:length(x)
    X=X+x(i);
    Y=Y+y(i);
    XX=XX+x(i)*x(i);
    XY=XY+x(i)*y(i);
end
A=[length(x),X,Y;X,XX,XY];
for i=1:2
    if(A(i,i)==0)
        
        for j=i+1:2
            if(A(j,i)~=0)
                A([i,j],:)=A([j,i],:);
            end        
        end
    end     
    if(A(i,i)==0)
        error("can't solve");
    end
    %for ward elimination
    for j=i+1:2
        m=A(j,i)/A(i,i);
        A(j,:)=A(j,:)-m*A(i,:);
    end
end
if(A(2,2)==0)
    error("Infinite solution");
end

%backward subsitution
x=zeros(2,1);
x(2)=A(2,end)/A(2,2);
for j=n-1:-1:1
    sum=0;
    for k=j+1:2
        sum=sum+A(j,k)*x(j);
    end
    x(j)=(A(j,end)-sum)/A(j,j);
end
x