% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAjordnorm
% ---------------------------------------------------------------------
% Description:  MVAjordnorm computes a two dimensional scatterplot of 
%               two correlated normal random variables and its rotation 
%               such that the directions of maximal variance are the 
%               coordinate axes.
% ---------------------------------------------------------------------
% Usage:        MVAjordnorm
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Two dimensional scatterplot of two correlated normal 
%               random variables and its rotation such that the 
%               directions of maximal variance are the coordinate axes.
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Song Song
% ---------------------------------------------------------------------

n=150;
%Mu vector is zero
rho=0.8;
sig=[  1 0.8
     0.8   1];

[vector,value] = eig(sig);
ll = sqrt(value);
sh = vector*ll*vector';
nr = normrnd(0,1,n,size(sig,1));
x = nr*sh';

hold on
title('Normal Sample, n=150')
xlabel('Original Data (x1), Rotated Data (x1)')
ylabel('Original data (y2), Rotated Data (y2)')

%Plot original data
scatter(x(:,1),x(:,2),50,'k')

%Transformed data
y=x*vector;
scatter(y(:,1),y(:,2),25,'v','MarkerFaceColor',[0 0 1],'MarkerEdgeColor',[0 0 1])
hold off