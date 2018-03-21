%Fits entry file
%Matlab Project

import matlab.io.*
% gets file from a given file name
filename = input('Enter file name (including extention): ', 's');

magnification = input('Enter image magnification: ');

imMat=imread(filename);
% shows the original image
%figure, imshow(imMat)
% makes background stars dissapears for galaxies
imMat=imgaussfilt(imMat,3);
%figure, imshow(imMat)
% turns it into a black and white photo
level=graythresh(imMat);
BW=im2bw(imMat,level);
imshow(BW);
% only keeps the largest object
BW2 = bwareafilt(BW, 1);
figure, imshow(BW2)

% labels the point of focus
labeled = bwlabel(BW2, 1);

% gets the size of the white space
[r,c] = find(labeled == 1);
sizew = numel(r);

%numObj=bwconncomp(BW);
%val = max(numObj.PixelIdxList)

%BW=bwareaopen(BW,5000);x
%figure, imshow(BW);
%figure, imshow(imMat);
%subplot(1,2,1), imshow(imMat);
%subplot(1,2,2), imshow(BW);