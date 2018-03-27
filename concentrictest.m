% Load Image
% Crop Image
% Binary Image
bw = im2bw(crop_test); %#ok<IM2BW>
% Create Outline of Binary Image
ch = bwconvhull(bw);
    
[b,l] = bwboundaries(ch);
data = cell(1,1000);

imshow(imcomplement(crop_test)); 
for k = 1:length(b)
    boundary = b{k};
    data{k} = boundary;   
    hold on; plot(boundary(:,2),boundary(:,1),'r','Linewidth',2);    
end
data = cell2mat(data');

rows = data(:,1);
columns = data(:,2);

mask = ch;
distanceTransform = bwdist(~mask);
maxValue = max(distanceTransform(:));

% For Shrinking Polygons 

mask_hull = cell(1,1000);
for gl = 1 : round(floor(maxValue)/35) : floor(maxValue)
    mask1 = distanceTransform > gl;  
    mask_hull{gl} = mask1;
end

for i = 1: round(floor(maxValue)/35) : length(mask_hull)
    mask_hull{i} = +mask_hull{1,i};
    
end


for i = 1: round(floor(maxValue)/35) : length(mask_hull)
    binaryImage = mask_hull{1,i};
    [b2,l2] = bwboundaries(binaryImage);
    data2 = cell(1,1000);
        for k = 1:length(b2)
             boundary2 = b2{k};
             data2{k} = boundary2;            
             hold on; plot(boundary2(:,2),boundary2(:,1),'r','Linewidth',2);         
        end 
end
    

    


    
    
    
    
    
    
    
    
