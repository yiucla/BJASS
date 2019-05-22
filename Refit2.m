function [beta_S] = Refit2(X,Y,delta,beta_S)

    [n,p]= size(X);
    e = Y - X*beta_S;
    SC = Sc(1-delta,e);
    epp = ep(1-delta,e);
    B = (repmat(e',n,1)>=repmat(e,1,n));
    KMI = sum(repmat(epp',n,1) .* B .* repmat(e',n,1),2);
    tY = delta.*Y + (1-delta).*(X*beta_S + KMI./SC);   
    beta_S = (X'*X)^(-1)*X'*tY;
 
return