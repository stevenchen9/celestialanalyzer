%Fits entry file
%Matlab Project

import matlab.io.*
filename = input('Enter file name: ', 's');
imMat=imread(filename);
figure, imshow(imMat)
imMat=imgaussfilt(imMat,3);
figure, imshow(imMat)
level=graythresh(imMat);
BW=im2bw(imMat,level);
figure, imshow(BW);
s = regionprops(BW,'centroid');
plot(s)
%numObj=bwconncomp(BW);
%val = max(numObj.PixelIdxList)

%BW=bwareaopen(BW,5000);x
%figure, imshow(BW);
%figure, imshow(imMat);
%subplot(1,2,1), imshow(imMat);
%subplot(1,2,2), imshow(BW);

% this is a test
% 