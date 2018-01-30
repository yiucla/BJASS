function [S,beta_S,lnew] = BJASS(X,Y,delta,beta_ini,k,S,beta_S)

iter = 1;
maxiter = 500;
tol = 1;
u = max(eig(X'*X));
beta_old = beta_ini;
[n,p]= size(X);
gamma = zeros(p,1);
while (iter <= maxiter) && (tol > 1E-3)
    e = Y - X(:,S)*beta_S;
    SC = Sc(1 - delta,e);
    epp = ep(1 - delta,e);
    B = (repmat(e',n,1) >= repmat(e,1,n));
    KMI = sum(repmat(epp',n,1) .* B .* repmat(e',n,1),2);
    tY = delta .* Y + (1 - delta) .* (X(:,S) * beta_S + KMI./SC);  
    s = tY - X * beta_old;
    lold = - s'*s;
    gamma = beta_old + 1/u*X'*s;
    tmp = sort(abs(gamma),'descend');
    beta_new = gamma .* (abs(gamma)>=tmp(k));
    lnew = - (tY-X*beta_new)' * (tY-X*beta_new);
    if lnew < lold
        u = 2*u;
    end
    tol = norm(beta_new-beta_old);
    beta_old = beta_new;
    iter = iter + 1;
end

S = find(beta_old~=0);
beta_S = beta_old(S);

return