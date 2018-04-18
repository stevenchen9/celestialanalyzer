function classify(size, shape)
% takes in all the data and makes a prediction of celestial type

if shape == 1 % circle
    if size < 160000 % largest planet is 159,834 km
        disp('planet')
    elseif size > 167000 % smallest star found
        disp('star')
    else 
        % other info needed
    end
elseif shape == 0 % elliptical
    disp('galaxy')
else % irregular
    disp('nebula')
end

