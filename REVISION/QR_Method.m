A=[
    1,1,0;
    1,0,1;
    0,1,1;
];
clc;
function [Q]=gram_schmidt(A)
    [m,n]=size(A);
    Q=zeros(m,n);
    for i=1:n
        v=A(:,i);
        for j=1:i-1
            projection=Q(:,j)'*v;
            v=v-projection*Q(:,j);
        end
        Q(:,i)=v/norm(v);
    end
end

function [Ak]=qr(A)
    [m,n]=size(A);
    if(m~=n)
        error("must be square matrix");
    end
    Ak=A;
    for i=1:1000
        Q=gram_schmidt(A);
        R=inv(Q)*Ak;
        Ak_next=R*Q;
        if(norm(Ak_next-Ak)<0.000001)
            Ak=Ak_next;
            break;
        end
        Ak=Ak_next;
    end
end

Ak=qr(A);
diag(Ak)
Ak