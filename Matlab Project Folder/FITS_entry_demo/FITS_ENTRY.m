%Fits entry file
%Matlab Project

import matlab.io.*
imMat=imread('frame-irg-003712-3-0187.jpg');
imMat=imgaussfilt(imMat,4);
BW=im2bw(imMat,.3);
BW=bwareaopen(BW,5000);
figure, imshow(imMat);
subplot(1,2,1), imshow(imMat);
subplot(1,2,2), imshow(BW);

% this is a test
% 