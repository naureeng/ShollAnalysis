bw = im2bw(crop_test); %#ok<IM2BW>
ch = bwconvhull(bw); 

imshow(crop_test); 
s = regionprops(ch, 'centroid');
hold on; scatter(centroids(:,1), centroids(:,2), 'b*');





