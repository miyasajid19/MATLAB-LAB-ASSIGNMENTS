clc;
%coefficient matrix
A=[
    4,1,-1,1;
    1,4,-1,-1;
    -1,-1,5,1;
    1,-1,1,3;
];
B=[-2;-1;0;1];
[n,m]=size(A);
x0=zeros(n,1);
x1=zeros(n,1);
for k=1:1000000
    for i=1:n
        sum=0;
        for j=1:i-1
            sum=sum+A(i,j)*x1(j);
        end
        for j=i+1:n
            sum=sum+A(i,j)*x0(j);
        end
        x1(i)=1/A(i,i)* (B(i)-sum);
    end
    if(norm(x1-x0)<0.000001)
        fprintf("soution found \n");
        disp(x1)
        break;
    end
x0=x1;
end
