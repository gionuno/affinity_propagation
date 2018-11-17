function [A,R] = apclustering(X,T,s)
    A = zeros(size(X,1),size(X,1));
    R = zeros(size(X,1),size(X,1));
    S = zeros(size(X,1),size(X,1));
    for i = 1:size(X,1)
        for j = 1:size(X,1)
            S(i,j) = s(X(i,:),X(j,:));
        end
    end
    for t = 1:T
        for i = 1:size(X,1)
            for j = 1:size(X,1)
                a = j;
                for k = 1:size(X,1)
                    if j ~= k
                        if a == j || (A(i,k)+S(i,k) > A(i,a)+S(i.a))
                            a = k;
                        end
                    end
                end
                R(i,j) = (S(i,j)-S(i,a))-A(i,a);
            end
        end
        
        L = zeros(size(X,1),1);
        for j = 1:size(X,1)
            for k = 1:size(X,1)
                if k ~= j
                    L(j) = L(j) + max(0.0,R(k,j));
                end
            end
        end
        
        for j = 1:size(X,1)
            for i = 1:size(X,1)
                if i ~= j
                    A(i,j) = min(0.0,R(j,j)-max(0.0,R(i,j))+L(j));
                else
                    A(j,j) = L(j);
                end
            end
        end
    end
end
