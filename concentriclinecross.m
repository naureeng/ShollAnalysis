% Define and fill polygonal cross-sectional area
bw = im2bw(crop_test); %#ok<IM2BW>
ch = bwconvhull(bw);

mask = ch;
distanceTransform = bwdist(~mask);
maxValue = max(distanceTransform(:));


% Find Shrinking Polygons 
mask_hull = cell(1,1000);
for gl = 1 : round(floor(maxValue)/35) : floor(maxValue)
    mask1 = distanceTransform > gl;  
    mask_hull{gl} = mask1;
end

% Splice Image as Rings 
crop_out = crop_test;
crop_final = cell(1,1000); 
for i = 1: round(floor(maxValue)/35): length(mask_hull)
    crop_out(~mask_hull{1,i}) = 0;
    crop_final{i} = crop_out; 
   
end

imshow(crop_test);
x_hull = cell(1,1000);
y_hull = cell(1,1000); 
% Find Points in Outline of Shrinking Polygons
for i = 1: round(floor(maxValue)/35) : length(mask_hull)
    binaryImage = mask_hull{1,i};
    [b2,l2] = bwboundaries(binaryImage);
    data2 = cell(1,1000);
    
        for k = 1:length(b2)
             boundary2 = b2{k};
             data2{k} = boundary2;            
             x_hull{i} = boundary2(:,2);
             y_hull{i} = boundary2(:,1);
             %hold on; plot(x_hull, y_hull ,'r', 'Linewidth', 2);              
        end
end

% X_Coordinates and Y_Coordinates of Each Ring 
x_hull_new = x_hull(~cellfun(@isempty, x_hull));
y_hull_new = y_hull(~cellfun(@isempty, y_hull));
clear x_hull; clear y_hull; 

% Crop Skeletonized Binary Image into Outlines of Convex Hull 
bw = imbinarize(crop_test);
bw2 =  bwmorph(bw, 'skel', Inf);

mask_hull_new = mask_hull(~cellfun(@isempty, mask_hull));
crop_final = cell(1,1000);
for i = 1: 1 : (length(mask_hull_new)-1) 
     I = imsubtract(mask_hull_new{1,i}, mask_hull_new{1,i+1});
     crop_out = bw2;
     crop_out(~I) = 0;
     crop_final{i} = crop_out; 
     
end

crop_final_new = crop_final(~cellfun(@isempty, crop_final)); 


% X_Coordinates and Y_Coordinates of Dendritic Branches in Each Ring

dx = [-0.5 -0.5 0.5 0.5];
dy = [-0.5 0.5 -0.5 0.5];
x_points = cell(1,1000);
y_points = cell(1,1000); 
for i = 1: 1: length(crop_final_new)
    [y,x] = find(crop_final_new{1,i});
    x_corners = bsxfun(@plus, x, dx);
    y_corners = bsxfun(@plus, y, dy);
    x_corners = x_corners(:);
    y_corners = y_corners(:);
    x_points{i} = x_corners;
    y_points{i} = y_corners;
end

x_points_new = x_points(~cellfun(@isempty, x_points)); 
y_points_new = y_points(~cellfun(@isempty, y_points)); 
clear x_points; clear y_points;    

% Determine Intersections for Each Ring
x_intersect = cell(1,1000); 
y_intersect = cell(1,1000); 
for i = 1: 1: length(x_points_new) 
    [xi,yi] = polyxpoly(x_points_new{1,i}, y_points_new{1,i}, x_hull_new{1,i}, y_hull_new{1,i}, 'unique');
    x_intersect{i} = xi;
    y_intersect{i} = yi; 
end

% Clean Empty Contents of Cell Array
x_intersect_final = x_intersect(~cellfun(@isempty, x_intersect));
y_intersect_final = y_intersect(~cellfun(@isempty, y_intersect)); 
clear x_intersect; clear y_intersect; 

N = cell(1,length(x_intersect_final));  
for i = 1:1:length(x_intersect_final)
    N{i} = size(x_intersect_final{1,i}, 1);
end

N = cell2mat(N); 














