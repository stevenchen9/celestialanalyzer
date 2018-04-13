%Fits entry file
%Matlab Project

import matlab.io.*
% gets file from a given file name
filename = input('Enter file name (including extention): ', 's');

magnification = input('Enter image magnification: ');
distance = input('Enter image distance: '); 

imMat=imread(filename);

%size = getsize(imMat, maginification, distance);
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
%profile = makintprof(grayscale);
%figure, mesh(profile);

BW=im2bw(imMat,level);
%figure, imshow(BW);
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
figure, imshow(grayscale);
figure, imshow(BW);
%first attempt polar plot from COM of galaxy

theta=0:0.01:2*pi;
x1=[xcoord,cos(theta)*round(stats{1,2})];
y1=[xcoord,sin(theta)*round(stats{1,2})];
rho=mean(improfile(grayscale,x1,y1));
figure, plot(rho);


%intensity plot from image center
%using improfile and a line segment the length of the major axis we can see
%the intensity of the entire 
xi=[xcoord,xcoord];
yi=[ycoord,ycoord-round(stats{1,2})];
c=improfile(grayscale,xi,yi);
figure, plot(c);

