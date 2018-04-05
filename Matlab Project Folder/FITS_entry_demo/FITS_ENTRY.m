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
figure, imshow(imMat)
% turns it into a black and white photo
level=graythresh(imMat);
grayscale=rgb2gray(imMat);
%takes rgb and turn to grayscale

%intensity profile
figure, imshow(grayscale);
%improfile(grayscale,(1:1488),(1:1488))
%have created a 3d intensity plot which will aid analysis
A=zeros(1488,2048);
x=[1,2047];
y=[1,1];
figure, plot(improfile(grayscale,x,y))
for j=1:2040
    for i=1:1480
        A(i,j)=grayscale(i,j);
    end
end
figure, mesh(A);

BW=im2bw(imMat,level);
figure, imshow(BW);
%s = regionprops(BW,'centroid');
%plot(s)
numObj=bwconncomp(BW);
%val = max(numObj.PixelIdxList)

BW=bwareaopen(BW,5000);
imwrite(BW,'isolated.png');
figure, imshow(BW);

stats = regionprops('table',BW,'Centroid','MajorAxisLength','MinorAxisLength','Eccentricity');
eccentricity= stats(1,4);