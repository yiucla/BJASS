function [beta_S] = Refit1(X,Y,delta)

    SC = Sc(delta,Y);
    tY = delta./SC;
    beta_S = (X'*X)^(-1)*X'*(tY.*Y);
  
return