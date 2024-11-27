A=[1,2,3;4,5,6;7,8,9];
k=1000;
x=[1;1;1];
for i=1:100000
    y=A*x;
    k1=max(abs(y));
    x1=1/k1*y;
    if(norm(k1-k)<0.00001)  
        k=k1;
        x=x1;
        break;
    end
    k=k1;
    x=x1;

end
x
k