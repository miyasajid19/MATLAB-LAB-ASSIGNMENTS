A=[4.63,-1.21,3.22;-3.07,5.48,2.11;1.26,3.11,4.57];
B=[2.22;-3.17;5.11];
X=[0;0;0];
format short
X1=[0;0;0];
for k=1:10000
    for i=1:3
        sum=0;
        sum1=0;
        for j=1:i-1
            sum=sum+A(i,j)*X(j);
        end
        for j=i+1:3
            sum1=sum1+A(i,j)*X(j);
        end
        X1(i)=1/A(i,i)*(B(i)-sum-sum1);
    end
        if((norm(X1-X))<10^(-3))
            X1
            k
            break;
        end
        X=X1;
end



