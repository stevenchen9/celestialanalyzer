%Fits entry file
%Matlab Project

import matlab.io.*
imMat=imread('frame-irg-003712-3-0187.jpg');
BW=im2bw(imMat,.4);
imshow(imMat);
figure, imshow(BW);
