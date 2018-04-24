function [result, cutoff] = getsize(img, distance, stats)
% takes in a black and white image and a magnification and determines the size
% of the largest object in the image

%longstart = input('Enter mu_start: ');
%longend = input('Enter mu_end; ');
latstart = input('Enter nu_start: ');
latend = input('Enter nu_end: ');

[x,y] = size(img);

% calculation for angular size in degrees
radperpix = (abs(latend-latstart) / x);

% apply gaussian filter
img2=imgaussfilt(img,3);

level=im2bw(img2, 0.4);

BW=bwareaopen(level,5000);
% labels the point of focus
labeled = bwlabeln(BW, 1);

% gets the size of the white space
[r,c] = find(labeled == 1);
rc = [r c];
sizew = numel(r);

cutoff = false;
for i = 1:sizew
    if rc(i, 1) == 0 || rc(i, 2) == 0
        cutoff = true;
    end
end

result = (distance / ((1/(radperpix * max(stats.MajorAxisLength)))*57));
end

