function [S,beta_S,lnew] = KSV(X,Y,delta,beta_ini,k)

iter = 1;
maxiter = 500;
tol = 1;
u = max(eig(X'*X));
beta_old = beta_ini;
[n,p]= size(X);
gamma = zeros(p,1);
while (iter <= maxiter) && (tol > 1E-3)
   
    SC = Sc(delta,Y);
    tY = delta./SC;
    s = tY .* Y-X * beta_old;
    lold = - s'*s;
    gamma = beta_old + 1/u*X'*s;
    tmp = sort(abs(gamma),'descend');
    beta_new = gamma .* (abs(gamma)>=tmp(k));
    lnew = - (tY.*Y-X*beta_new)' * (tY.*Y-X*beta_new);
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