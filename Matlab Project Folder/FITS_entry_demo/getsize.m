function result = getsize(img, magnification)
% takes in an image and a magnification and determines the size
% of the largest object in the image

% labels the point of focus
labeled = bwlabel(img, 1);

% gets the size of the white space
[r,c] = find(labeled == 1);
sizew = numel(r);


end

