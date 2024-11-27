function [Q]=gram_schimdt(A)
    [m,n]=size(A);
    Q=zeros(m,n);
    temp=zeros(n,n);
    for i=1:n
        v=A(:,i);%extracting column vector
        for j=1:i-1
            temp(j,i)=Q(:,j)'*v;
            v=v-temp(j,i)*Q(:,j);
        end
        temp(i,i)=norm(v);
        Q(:,i)=v/temp(i,i);
    end
end
format short
function [Ak]=QR_Algorithm(A)
    [m,n]=size(A);
    if(m~=n)
        error("must be square matrix\n");
    end
    Ak=A;
    for i=1:10000
        Q=gram_schimdt(Ak);
        R=inv(Q)*Ak;
        Ak_next=R*Q;
        if(norm(Ak-Ak_next)<0.0001)
            Ak=Ak_next;
            break;
        end
        Ak=Ak_next;
    end
end


A = [1,1,0;1,0,1;0,1,1];
Ak=QR_Algorithm(A);
Ak
diag(Ak)