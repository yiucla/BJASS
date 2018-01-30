# BJASS

A New Joint Screening Method for Right-Censored Survival Data with Ultrahigh Dimensional Covariates
 
Yi Liu, Xiaolin Chen, and Gang Li


Description: 

This program implements the BJASS joint screening method for DLBCL data (stored in matlab.mat) described in Section 4 of the paper.


Usage: Run the MAIN.m function. 

Main function: KSV(X,Y,delta,beta_ini,d); BJASS(X,Y,delta,beta_ini,d,S,beta_S);

    X: Design matrix
    Y: Time to event or censoring
    delta: 0=censoring; 1 otherwise
    beta_ini: Initial value for IHT algorithm
    d: Screened model size
    S: Active index set  
    beta_S: Parameter estimates of active variables

Output: Active index set and parameter estimates of active variables.

