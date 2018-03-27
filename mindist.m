% Practice Run for All Cells 

min_dist_final = cell(10000,10000); 
dist_final = cell(10000,10000); 

for i = 1:1:41
        x = A(:,i);
        y = B(:,i);
        [xs,ys] = meshgrid(x,y);
        dist = sqrt ( (xs-xs').^2 + (ys-ys').^2 );
        dist_final{i} = dist; 
     
        min_dist = min(dist(dist~=0 & isnan(dist)==0)); 
        min_dist_final{i} = min_dist;
        min_ind = find(dist==min_dist);
end

min_dist_final = cell2mat(min_dist_final);

