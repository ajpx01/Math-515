%% Exercise 2
% Calculate spectral radius
A=[201 199;199 201];
spectralRadius = max(abs(eig(A))) % From Matlab Copilot and 
% https://www.mathworks.com/matlabcentral/answers/378909-spectral-radius-of-matrix

% Compute condition number using L2 norm
conditionNumber1 = cond(A, 2) % From Matlab Copilot using L2 norm

% Calculate the L2 norm of A and its inverse, https://www.mathworks.com/help/matlab/ref/norm.html
A1=norm(A);
A2=norm(A^-1);

% Solve for r, the residual
xhat=[-0.5 0.5]';
b=[-2 2]';
r=A*xhat-b

% Find the lower and upper bound on norm of relative error, from textbook
% pg.181-183
lower_bound=(1/(A1*A2))*(norm(r)/norm(b))
upper_bound=A1*A2*(norm(r)/norm(b))

x=(b\A)' % How to divide matrices on Matlab from Google Gemini

compare_estimate_actual=xhat-x

r1=A*compare_estimate_actual 
% When r=Ae, where e=xhat-x, we get the r value that provides a tight bound
% on the error

