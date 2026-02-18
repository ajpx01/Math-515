%% Exercise 6 (Code Generated from Link in Canvas Announcements)
%%
rgbGH=imread('GraceHopper.jpg');
figure();
image(rgbGH), axis image;  %plot color image

bwGH=rgb2gray(rgbGH); %convert to grayscale
imGH=double(bwGH); %convert from unsigned integers to double for calculutions


%plt grayscale image
figure();
colormap(gray(256));
image(imGH);
daspect([1 1 1]) %this preserves aspect ratio, could also use "axis image"
title('Original');


%Compute singular value decomposition
[U S V]=svd(imGH);

%plot singular values on semilog scale.
%Notice how quickly the magnitude drops.
figure;
semilogy(diag(S))
ylabel('Singular Values')
xlabel('n')


%pick number of singular values to use for reconstructing image
Nsvals=[200, 100, 50, 25, 10];

%plot "compressed" images by only include the largest ns singular values
for jj=1:length(Nsvals)
    ns=Nsvals(jj);
    
    imNs=U(:,1:ns)*S(1:ns,1:ns)*V(:,1:ns)';
    
    figure();
    colormap(gray(256));
    image(imNs);
    daspect([1 1 1])
    title([num2str(ns)  ' singular values']);
    
end