function classify(size, shape)
% takes in all the data and makes a prediction of celestial type

if shape == 1 % circle
    if size < 334000 % largest planet has radius of 159,834 km
        fprintf('\n')
        disp('Object is a planet')
    elseif size > 334000 % smallest star found has a diameter of 334000
        fprintf('\n')
        disp('Object is a star')
    else 
        % other info needed
    end
elseif shape == 0 % elliptical
    fprintf('\n')
    disp('Object is a galaxy')
else % irregular
    fprintf('\n')
    disp('Object is a nebula')
end

