x=[0,8,16,24,32,40];
y=[14.621,11.843,9.870,8.418,7.305,6.413];
b=40;
s=0;
for i =1:length(x)
    p=1;
    for j=1:length(x)
        if j~=i
            p=p*(b-x(j))/(x(i)-x(j));
        end
    end
    s=s+p*y(i);
end
s