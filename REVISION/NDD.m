x=[1,1.5,2,2.5];
D=zeros(length(x),length(x));
D(1,1)=2.7183;
D(2,1)=4.4817;
D(3,1)=7.3891;
D(4,1)=12.1825;

for i=2:length(x)
    for j=i:length(x)
        D(j,i)=(D(j,i-1)-D(j-1,i-1))/(x(j)-x(j-i+1));
    end
end
D
b=2.25;
products=zeros(1,length(x));
for i=1:length(x)
    products(i)=1;
    for j=1:i-1
        products(i)=products(i)*(b-x(j));
    end 
end

sum=0;
for i=1:length(x)
    sum=sum+D(i,i)*products(i);
end
sum