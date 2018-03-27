% Sholl Analysis 

bw = imbinarize(crop_test);
% Skeletonize Binary Image
bw2 = bwmorph(bw, 'skel', Inf);
% Plot Branch Points 
mn = bwmorph(bw2, 'branchpoints'); 
[row, column] = find(mn);
branchPts = [row column];
figure; imshow(imcomplement(bw2)); 
hold on; 
scatter(branchPts(:,2), branchPts(:,1),'r','filled','Linewidth',0.5); 

% Plot Convex Hull
ch = bwconvhull(bw);   
[b,l] = bwboundaries(ch);
data = cell(1,1000);

for k = 1:length(b)
    boundary = b{k};
    data{k} = boundary;    
    hold on; plot(boundary(:,2),boundary(:,1),'b','Linewidth',2);    
end
data = cell2mat(data');

columns = data(:,1);
rows = data(:,2);
hold off;
