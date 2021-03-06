clc, clear
load('matlab.mat')
[n,p]=size(Z);
Y = X;
X = Z;
X = (X - ones(n,1)*mean(X))./(ones(n,1)*std(X));
Y = log(Y);
Y = Y - mean(Y);
delta = de;
d = floor(n/log(n));
mr = 1 - sum(delta)/n;

SC = Sc(delta,Y);
tY = delta./SC;
y = tY.*Y;
y_c = y - mean(y);
%% glmnet
addpath(genpath(''));  % glmnet path
fit = glmnet(X, y_c);
cvfit = cvglmnet(X, y_c);
lambda = cvfit.lambda_min;
beta_ini = fit.beta(:,find(fit.lambda==lambda));

%% BJASS
[S,beta_S,l] = KSV(X,Y,delta,beta_ini,d); 
beta_S = Refit1(X(:,S),Y,delta);
[Snew,beta_Snew,l_new] = BJASS(X,Y,delta,beta_ini,d,S,beta_S);
beta_Snew = Refit2(X(:,Snew),Y,delta,beta_S);
[Snew2,beta_Snew2,l_new2] = BJASS(X,Y,delta,beta_ini,d,Snew,beta_Snew);
beta_Snew2 = Refit2(X(:,Snew2),Y,delta,beta_Snew);
[Snew3,beta_Snew3,l_new3] = BJASS(X,Y,delta,beta_ini,d,Snew2,beta_Snew2);
beta_Snew3 = Refit2(X(:,Snew3),Y,delta,beta_Snew2);
[Snew4,beta_Snew4,l_new4] = BJASS(X,Y,delta,beta_ini,d,Snew3,beta_Snew3);
beta_Snew4 = Refit2(X(:,Snew4),Y,delta,beta_Snew3);
[Snew5,beta_Snew5,l_new5] = BJASS(X,Y,delta,beta_ini,d,Snew4,beta_Snew4);
beta_Snew5 = Refit2(X(:,Snew5),Y,delta,beta_Snew4);


