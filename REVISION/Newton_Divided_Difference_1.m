x=[0,1,3,4,7];
D=zeros(length(x),length(x));
D(1,1)=1;
D(2,1)=3;
D(3,1)=49;
D(4,1)=129;
D(7,1)=813;

% calculating divided difference
%since first divided difference is already calculated then we go with
%second iteration
for i=2:length(x)
    for j=i:length(x)
        D(i,j)=(D(j,i-1)-D(j-1,i-1))/(x(j)-x(j-i+1));
    end
end
%calculating products
p=0.3;
product=zeros(1,length(x));
for i=1:length(x)
    product(i)=1;
    for j=1:i-1
        product(i)=product(i)*(p-x(j));
    end
end

sum=0;
for i =1:length(x)
    sum=sum+D(i,i)*product(i);
end
fprintf("The solution is %f at x=%f",sum,p);