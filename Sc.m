function [ Sc ] = Sc(delta,X)

[n,p] = size(X);
[Xsort, index] = sort(X);
delta_ = 1 - delta;
Sc = ones(n,1);
Sc(1) = 1 - delta_(index(1))/sum(X>=Xsort(1));
for i = 2:n
    Sc(i) = Sc(i-1)*(1-delta_(index(i))/sum(X>=Xsort(i)));
end

Sc(n) = Sc(n-1);
Sc(index) = Sc; 

end

