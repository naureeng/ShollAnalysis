% Nearest Neighbor Analysis

A = ptxset(:,1:2:end); % X-Values of Data Set
B = ptxset(:,2:2:end); % Y-Values of Data Set
dist_final = cell(1, length(A)); 

for i = 1:1:41
        x = A(:,i);
        y = B(:,i);
        [xs,ys] = meshgrid(x,y);
        dist = sqrt ( (xs-xs').^2 + (ys-ys').^2 );
        dist_final{i} = dist; 
        
end

test2 = cell(length(A));

for j = 1:length(dist_final)
    testset = dist_final{1,j};
    zero_ind = find(testset == 0);
    testset(zero_ind) = Inf;
    test2{j} = min(testset)';
    
end

