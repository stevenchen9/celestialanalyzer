function [stats, xcoord, ycoord] = plotcentroid(BW, grayscale)
%this program puts a black dot on the centroid and shows us the location,
%also useful to understand the stats function

h=(ones(20,20)/400);
BW=imfilter(BW,h);
stats = regionprops('table',BW,'Centroid','MajorAxisLength','MinorAxisLength','Eccentricity', 'Perimeter','EquivDiameter');
xcoord= round(stats{1,1}(1,2));
ycoord= round(stats{1,1}(1,1));
BW((xcoord-5):(xcoord+5),(ycoord-5):(ycoord+5))=0;
%first attempt polar plot from COM of galaxy

theta=0:0.01:2*pi;
x1=[xcoord,cos(theta)*round(stats{1,2})];
y1=[xcoord,sin(theta)*round(stats{1,2})];
rho=mean(improfile(grayscale,x1,y1));
%figure, plot(rho);
end

