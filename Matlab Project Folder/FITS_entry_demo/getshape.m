function shape = getshape(stats)
% Uses major and minor axis to determine shape
major = stats.MajorAxisLength;
minor = stats.MinorAxisLength;

ratio = major/minor;

if ratio > 0.95 || ratio < 1.05
    shape = 1;
elseif ratio > 0.5 || ratio < 1.5
    shape = 0;
else 
    shape = -1;
end
end

