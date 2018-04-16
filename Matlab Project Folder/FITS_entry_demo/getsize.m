function result = getsize(img, distance)
% takes in a black and white image and a magnification and determines the size
% of the largest object in the image

%longstart = input('Enter mu_start: ');
%longend = input('Enter mu_end; ');
latstart = input('Enter nu_start: ');
latend = input('Enter nu_end: ');

[x,y] = size(img);

% calculation for angular size in degrees
radperpix = (latend-latstart) / x;

% apply gaussian filter
img2=imgaussfilt(img,3);

level=graythresh(img2);

BW=bwareaopen(level,5000);
% labels the point of focus
labeled = bwlabel(BW, 1);

% gets the size of the white space
[r,c] = find(labeled == 1);
sizew = numel(r);

result = ((1/(radperpix * sizew)) * 57 / distance);
end

