function shape = getshape(stats)

P1=stats{1,6};
CircAssumed=pi*((stats{1,2}+ stats{1,3})/2);
ratio=(CircAssumed/P1);
%shape = -2;
if ratio<.8
   %fprintf('this object is irregular in shape: ');
    shape = -1; % for irregular
elseif ratio >.9 && .5 > stats{1,4}
    %fprintf('\nthis object is circular in shape: \n');
    shape = 1; % for circle
else
    %fprintf('\nthis object is elliptical in shape: \n');
    shape = 0; % ellipse
end 
end

