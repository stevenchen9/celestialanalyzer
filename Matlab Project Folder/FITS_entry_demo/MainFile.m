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
    
else
    %magnification = input('Enter image magnification: ');
    distance = input('Enter image distance (km): '); 
    imMat=imread(filename);
end



% shows the original image
%figure, imshow(imMat)
% makes background stars dissapears for galaxies
<<<<<<< HEAD:Matlab Project Folder/FITS_entry_demo/FITS_ENTRY.m
imMat=imgaussfilt(imMat,3);
%figure, imshow(imMat)
=======
%imMat=imgaussfilt(imMat,3);
figure, imshow(imMat)
>>>>>>> 9341fb258bf9b2296a8ccf878dadd84c5e84e1df:Matlab Project Folder/FITS_entry_demo/MainFile.m
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
%imwrite(BW,'isolated.png');




%this program puts a black dot on the centroid and shows us the location,
%also useful to understand the stats function
h=(ones(20,20)/400);
BW=imfilter(BW,h);
stats = regionprops('table',BW,'Centroid','MajorAxisLength','MinorAxisLength','Eccentricity', 'Perimeter','EquivDiameter');
xcoord= round(stats{1,1}(1,2));
ycoord= round(stats{1,1}(1,1));
BW((xcoord-5):(xcoord+5),(ycoord-5):(ycoord+5))=0;
%figure, imshow(grayscale);
%figure, imshow(BW);
%first attempt polar plot from COM of galaxy

theta=0:0.01:2*pi;
x1=[xcoord,cos(theta)*round(stats{1,2})];
y1=[xcoord,sin(theta)*round(stats{1,2})];
rho=mean(improfile(grayscale,x1,y1));
%figure, plot(rho);
<<<<<<< HEAD:Matlab Project Folder/FITS_entry_demo/FITS_ENTRY.m
=======

%star cluster analysis
stats1 = regionprops('table',grayscale,'Centroid','MajorAxisLength','MinorAxisLength','Eccentricity', 'Perimeter','EquivDiameter');
>>>>>>> 9341fb258bf9b2296a8ccf878dadd84c5e84e1df:Matlab Project Folder/FITS_entry_demo/MainFile.m


%intensity plot from image center
%using improfile and a line segment the length of the major axis we can see
%the intensity of the entire 
xi=[xcoord,xcoord];
yi=[ycoord,ycoord-round(stats{1,2})];
c=improfile(grayscale,xi,yi);
figure, plot(c);

%get shape test funciton below we will then shift it to the separate file
%it it works
%shape = getshape(stats); % -1 if irregular, 0 if ellipse and 1 if circle
[B,L]=bwboundaries(BW,'noholes');

%using perimeter of real object and expected perimeter from an average of
%major and minor axes we will differentiate

P1=stats{1,6};
CircAssumed=pi*((stats{1,2}+ stats{1,3})/2);
ratio=(CircAssumed/P1);
%shape = -2;
if ratio<.8
<<<<<<< HEAD:Matlab Project Folder/FITS_entry_demo/FITS_ENTRY.m
    fprintf('\nthis object is irregular in shape: \n');
=======
<<<<<<< HEAD
   fprintf('this object is irregular in shape: ');
else if ratio >.9 && .5 > stats{1,4}
    fprintf('this object is circular in shape: ');
    else
       fprintf('this object is elliptical in shape: ');
  end
end

     
=======
    fprintf('this object is irregular in shape: \n');
>>>>>>> 9341fb258bf9b2296a8ccf878dadd84c5e84e1df:Matlab Project Folder/FITS_entry_demo/MainFile.m
    shape = -1; % for irregular
elseif ratio >.9 && .5 > stats{1,4}
    fprintf('\nthis object is circular in shape: \n');
    shape = 1; % for circle
else
    fprintf('\nthis object is elliptical in shape: \n');
    shape = 0; % ellipse
end 
>>>>>>> 8b7d9c9ae67ad6538e2248cde84c15dff8167820

%display label matric and draw each boundary
%imshow(label2rgb(L,@jet,[.5 .5 .5]))
hold on
for k=1:length(B)
    boundary = B{k};
    plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
end

[result, cutoff] = getsize(imMat, distance, stats);
fprintf('\nSize of Object: %d km\n\n', result)
if cutoff == true
    disp('The image is cutoff')
else 
    disp('The image is not cutoff')
end
classify(result, shape)
