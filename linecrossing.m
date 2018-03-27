% Define and fill a polygonal area in the plane
bw = im2bw(crop_test); %#ok<IM2BW>
ch = bwconvhull(bw);
[y,x] = find(bw);
dx = [-0.5 -0.5 0.5 0.5];
dy = [-0.5 0.5 -0.5 0.5];
x_corners = bsxfun(@plus, x, dx);
y_corners = bsxfun(@plus, y, dy);
x_corners = x_corners(:);
y_corners = y_corners(:);

imshow(bw, 'InitialMagnification', 'fit');
hold on;
plot(x_corners, y_corners, '.');
hold off;

% Compute Convex Hull
k = convhull(x_corners, y_corners);
x_hull = x_corners(k);
y_hull = y_corners(k);
figure; 
hold on;
plot(x_hull, y_hull, 'r','Linewidth',4);
hold off;

% Define and fill a polygon
mapshow(x_hull, y_hull, 'DisplayType','polygon','LineStyle','none');

% Define and display dendritic tree
%mapshow(x_corners,y_corners,'Marker','.')

% Intersect the polyline with the rectangle
[xi, yi] = polyxpoly(x_corners, y_corners, x_hull, y_hull, 'unique');
mapshow(xi,yi,'DisplayType','point','Marker','o')

