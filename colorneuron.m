% Color Code Neuron by Hits

% Neuron Data Set
bw = im2bw(crop_test); %#ok<IM2BW>
ch = bwconvhull(bw);
[y,x] = find(bw);
dx = [-0.5 -0.5 0.5 0.5];
dy = [-0.5 0.5 -0.5 0.5];
x_corners = bsxfun(@plus, x, dx);
y_corners = bsxfun(@plus, y, dy);
x_corners = x_corners(:);
y_corners = y_corners(:);

% Color Code by using Z-Axis to Represent Number of Dendritic Intersections

% Value of Dendritic Intersections is N 
N = cell(1,length(x_intersect_final));  
for i = 1:1:length(x_intersect_final)
    N{i} = size(x_intersect_final{1,i}, 1);
end

N = cell2mat(N); 

% Value of Number of Coordinates in Group is K 
K = cell(1, length(x_points_new));
for i = 1:1:length(x_points_new)
    K{i} = size(x_points_new{1,i},1);
end

K = cell2mat(K); 

Z = cell(1,length(N)); 
% Create Array of Z-Axis Values with repmat
for i = 1:1: length(N)
    Z{i} = repmat(N(1,i), [K(1,i),1]);
    
end

Z_concat = vertcat(Z{:});

% Create Array of X-Axis Values
X_concat = vertcat(x_points_new{1:length(x_points_new)});

% Create Array of Y-Axis Values
Y_concat = vertcat(y_points_new{1:length(y_points_new)});

% Create Plot
plot3c(X_concat, Y_concat, Z_concat,10); 








