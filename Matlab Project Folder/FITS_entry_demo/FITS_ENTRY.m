%Fits entry file
%Matlab Project

import matlab.io.*
imMat=imread('frame-irg-003712-3-0187.jpg');
BW=im2bw(imMat,.4);
subplot(1,2,1), imshow(imMat);
subplot(1,2,2), imshow(BW);

% this is a test