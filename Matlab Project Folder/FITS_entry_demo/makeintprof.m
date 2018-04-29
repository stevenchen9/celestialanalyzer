function intprofile = makeintprof(grayscale)
imMat=imread('test1.jpg');
grayscale=rgb2gray(imMat);
%intensity profile
figure, imshow(grayscale);
%improfile(grayscale,(1:1488),(1:1488))
%have created a 3d intensity plot which will aid analysis
intprofile = zeros(1488,2048);
x=[1,2047];
y=[1,1];
figure, plot(improfile(grayscale,x,y));
for j=1:2040
    for i=1:1480
        intprofile(i,j)=grayscale(i,j);
    end
    
end
figure, mesh(intprofile);
end

