function ep = ep(delta,X)
[n,p] = size(X);
[Xsort, index] = sort(X);
delta_ = 1 - delta;

tmp1 = delta_(index)./ sum(repmat(Xsort',n,1)>= repmat(Xsort,1,n),2);
tmp2 = ones(n,1) - tmp1;
tmp3 = [1;tmp2(1:n-1)];
ep = tmp1 .* cumprod(tmp3);
ep(index) = ep;

end


