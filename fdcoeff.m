% Layout of Code from https://users.soe.ucsc.edu/~hongwang/AM213B/Ref_book_2/Chap_1.pdf
% Edits to code, and understanding of code were taken from suggestion on
% MATLAB Copilot
function coeffs=fdcoeff(k,xbar,x_j)
x_j=x_j(:);
n=numel(x_j);
A=ones(n,n);
A(1,:)=1;
deltax=(x_j(:)-xbar).';
for i=2:n
    A(i,:)=(deltax.^(i-1))./factorial(i-1);
end
b=zeros(n,1);
b(k+1)=1;
coeffs=(A\b).';