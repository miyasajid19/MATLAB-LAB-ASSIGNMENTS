clc;
x=[1,1.5,2,2.5];
D=zeros(4,4);
D(1,1)=2.7183;
D(2,1)=4.4817;
D(3,1)=7.3891;
D(4,1)=12.1825;

%calculating divided difference
for i=2:4
    for j=i:4
        D(j,i)=(D(j,i-1)-D(j-1,i-1))/(x(j)-x(j-i+1));
    end
end

%calculating product
val=2.25;
product=zeros(1,4);
for i=1:4
   product(i)=1;
   for j=1:i-1
       product(i)=product(i)*(val-x(j));
   end
end

%sum
sum=0;
for i=1:4
    sum=sum+product(i)*D(i,i);
end
sum