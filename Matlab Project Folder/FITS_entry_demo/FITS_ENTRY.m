%Fits entry file
%Matlab Project

import matlab.io.*
% gets file from a given file name
filename = input('Enter file name (including extention): ', 's');

magnification = input('Enter image magnification: ');
distance = input('Enter image distance: '); 

imMat=imread(filename);

size = getsize(imMat, maginification, distance);
% shows the original image
figure, imshow(imMat)
% makes background stars dissapears for galaxies
imMat=imgaussfilt(imMat,3);
figure, imshow(imMat)
% turns it into a black and white photo
level=graythresh(imMat);
grayscale=rgb2gray(imMat);
%takes rgb and turn to grayscale

%intensity profile
profile = makintprof(grayscale);
figure, mesh(profile);

BW=im2bw(imMat,level);
figure, imshow(BW);
%s = regionprops(BW,'centroid');
%plot(s)
numObj=bwconncomp(BW);
%val = max(numObj.PixelIdxList)

BW=bwareaopen(BW,5000);
imwrite(BW,'isolated.png');




%this program puts a black dot on the centroid and shows us the location,
%also useful to understand the stats function
stats = regionprops('table',BW,'Centroid','MajorAxisLength','MinorAxisLength','Eccentricity');
xcoord= round(stats{1,1}(1,2));
ycoord= round(stats{1,1}(1,1));
BW((xcoord-5):(xcoord+5),(ycoord-5):(ycoord+5))=0;
figure, imshow(BW);

