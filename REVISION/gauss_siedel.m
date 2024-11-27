A=[
    10,8,-3,1;
    2,10,1,-4;
    3,-4,10,1;
    2,2,-3,10;
];
b=[16 9 10 11];
x0=[0;0;0;0];
x1=[0;0;0;0];
[n,m]=size(A);
for k=1:1000
    for i=1:n
        sum=0;
        for j=1:i-1
            sum=sum+A(i,j)*x1(j);
        end
        for j=i+1:n
            sum=sum+A(i,j)*x0(j);
        end
        x1(i)=1/A(i,i)*(B(i)-sum);
    end
        if(norm(x1-x0)<0.00000000001)
            x=x1;
            break;
        end
    x0=x1;
end
x
k