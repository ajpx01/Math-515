%% Exercise 3
x=[1 1 1;1 1 0;1 0 0]; % Matrix for QR decomposition by Householder Reflections
[R,U]=house_qr(x) % Compute decomposition
I=eye(size(U)); % Set the identity matrix equal to the size of U
Q=house_apply(U,I) % Solve for value Q from U and I
QR=Q*R % Show that QR=Q*R and that the decomposition worked

x1=rand(100,100)
[R1 U1]=house_qr(x1)
I1=eye(size(U1));
Q1=house_apply(U1,I1);
Step1=Q1'*Q1; % Equals I the identity matrix
Step2=Q1*Q1'; % Equals I the identity matrix
% Since Q1'*Q1=I and Q1*Q1'=I, Q is orthogonal. Definition for Orthogonal
% matrices was acquired from Google Gemini
Step4=R1; % R1 is and upper triangular matrix
Step5=Q1*R1 % A equals Q1*R1 so the code is correct
