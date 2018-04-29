function makeintplot(stats, grayscale, xcoord, ycoord)
% makes the intensity plot given stats

%intensity plot from image center
%using improfile and a line segment the length of the major axis we can see
%the intensity of the entire 
xi=[xcoord,xcoord-round(stats{1,2}),xcoord,xcoord-round(stats{1,2}),xcoord,xcoord];
yi=[ycoord,ycoord-round(stats{1,2}),ycoord,ycoord+round(stats{1,2}),ycoord,ycoord+round(stats{1,2})];
c=improfile(grayscale,xi,yi);
figure, plot(c);
end

