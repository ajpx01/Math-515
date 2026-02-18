%% Exercise 4
n=7;
A=magic(n);
x=[1:n]';
b=A*x;
[Q, R]=gs_factor(A)
x2=qr_solve(Q,R,b)
solvenorm=norm(x-x2)

