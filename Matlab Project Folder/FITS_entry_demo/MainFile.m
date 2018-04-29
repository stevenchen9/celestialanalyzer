%Fits entry file
%Matlab Project

import matlab.io.*
% gets file from a given file name
filename = input('Enter file name (including extention): ', 's');

[filepath,name,ext] = fileparts(filename); % in order to distinguish between file types

if isequal(ext, '.fits') % check if it is a fits file
    imMat = fitsread(filename, 'image');
    info = fitsinfo(filename);
    display(info)
    error('fits files not supported'); % fits files not supported
else
    distance = input('Enter image distance (km): '); 
    imMat=imread(filename);
end



% shows the original image
figure, imshow(imMat)
% makes background stars dissapears for galaxies
imMat=imgaussfilt(imMat,3);

% turns it into a black and white photo
level=graythresh(imMat);
grayscale=rgb2gray(imMat);

%takes rgb and turn to grayscale

%intensity profile
profile = makintprof(grayscale);
%figure, mesh(profile);

BW=im2bw(imMat,level);
%figure, imshow(BW);

numObj=bwconncomp(BW);

BW=bwareaopen(BW,5000);

stats = plotcentroid(BW); % plots the centroid and gets the stats of the object

makeintplot(stats);

[B,L]=bwboundaries(BW,'noholes');

%using perimeter of real object and expected perimeter from an average of
%major and minor axes we will differentiate

shape = getshape(stats); % -1 if irregular, 0 if ellipse and 1 if circle

[result, cutoff] = getsize(imMat, distance, shape); % gets the size of the diameter

fprintf('\nDiameter of Object: %d km', result);

if cutoff == true
    fprintf('\n\n')
    disp('The image is cutoff')
else 
    fprintf('\n\n')
    disp('The image is not cutoff')
end

if shape == -1
    fprintf('\nThis object is irregular in shape\n')
elseif shape == 0
    fprintf('\nThis object is elliptical\n')
else
    fprintf('\nThis object is circular\n')
end

classify(result, shape)
