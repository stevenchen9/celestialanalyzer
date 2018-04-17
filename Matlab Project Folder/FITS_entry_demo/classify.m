function [classification] = classify(size, shape)
% takes in all the data and makes a prediction of celestial type

if shape == 1 % circle
    if size < 160000 % largest planet is 159,834 km
        classification = ('planet');
    elseif size > 167000 % smallest star found
        classification = ('star');
    else 
        % other info needed
    end
end
end

