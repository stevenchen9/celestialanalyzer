function result = getsize(img, magnification, distance)
% takes in a black and white image and a magnification and determines the size
% of the largest object in the image

% apply gaussian filter
img2=imgaussfilt(img,3);

level=graythresh(img2);

BW=bwareaopen(level,5000);
% labels the point of focus
labeled = bwlabel(BW, 1);

% gets the size of the white space
[r,c] = find(labeled == 1);
sizew = numel(r);


end

