%Fits entry file
%Matlab Project

import matlab.io.*
% gets file from a given file name
filename = input('Enter file name (including extention): ', 's');

[filepath,name,ext] = fileparts(filename); % in order to distinguish between file types

if isequal(ext, '.fits') % check if it is a fits file
    imMat = fitsread(filename, 'image');
    
else
    magnification = input('Enter image magnification: ');
    distance = input('Enter image distance: '); 
    imMat=imread(filename);
end

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

intensity profile
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

%intensity plot from image center
%using improfile and a line segment the length of the major axis we can see
%the intensity of the entire 
xi=[xcoord, xcoord];
yi=[ycoord, ycoord+4*round(stats{1,2})];
improfile(imMat,xi,yi);

shape = getshape(stats); % -1 if irregular, 0 if ellipse and 1 if circle
