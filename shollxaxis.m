% Define and fill polygonal cross-sectional area
bw = im2bw(crop_test); %#ok<IM2BW>
ch = bwconvhull(bw);
figure; imshow(ch); 

% Compute Centroid 
stats = regionprops(ch, 'centroid'); 
centroid = stats.Centroid; 
hold on; 
scatter(centroid(:,1), centroid(:,2), 'filled', 'b');
hold off;
x_centroid = centroid(:,1);
y_centroid = centroid(:,2); 

dist_min = cell(1,length(mask_hull_new));
for i = 1:1:length(mask_hull_new)
   [B,L] = bwboundaries(mask_hull_new{1,i});
   for k = 1:length(B)
        boundary = B{k};
        x_mask = boundary(:,2);
        y_mask = boundary(:,1);
        dist_min{i} = abs(p_poly_dist(x_centroid, y_centroid, x_mask, y_mask));
   end
  
  
end

dist_min_f = cell2mat(dist_min);
r = sort(dist_min_f(1:length(N))); 
f = fit(r',N','smoothingspline');
figure; plot(f,r',N');
hold on; xlabel('Minimum Distance from Centroid','Fontsize',14);
hold on; ylabel('Number of Intersections','Fontsize',14);
hold on; scatter(r,N,'+','Linewidth',2);











    
    