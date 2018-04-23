<<<<<<< HEAD
function [result, cutoff] = getsize(img, distance, stats)
=======
function result = getsize(img, distance)
>>>>>>> 9341fb258bf9b2296a8ccf878dadd84c5e84e1df
% takes in a black and white image and a magnification and determines the size
% of the largest object in the image

%longstart = input('Enter mu_start: ');
%longend = input('Enter mu_end; ');
latstart = input('Enter nu_start: ');
latend = input('Enter nu_end: ');

<<<<<<< HEAD
%figure, imshow(img)
=======
>>>>>>> 9341fb258bf9b2296a8ccf878dadd84c5e84e1df
[x,y] = size(img);

% calculation for angular size in degrees
radperpix = abs(latend-latstart) / x;

% apply gaussian filter
img2=imgaussfilt(img,3);

<<<<<<< HEAD
level=im2bw(img2, 0.4);
%figure, imshow(level)
=======
level=graythresh(img2);
>>>>>>> 9341fb258bf9b2296a8ccf878dadd84c5e84e1df

BW=bwareaopen(level,5000);
% labels the point of focus
labeled = bwlabel(BW, 1);

% gets the size of the white space
[r,c] = find(labeled == 1);
sizew = numel(r);

<<<<<<< HEAD
cutoff = false;
for i = 1:sizew
    if rc(i, 1) == 0 || rc(i, 2) == 0
        cutoff = true;
    end
end

result = ((1/(radperpix * stats.MajorAxisLength)) * 57 / distance);
=======
result = ((1/(radperpix * sizew)) * 57 / distance);
>>>>>>> 9341fb258bf9b2296a8ccf878dadd84c5e84e1df
end

