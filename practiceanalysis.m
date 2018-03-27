A = ptxset(:,1:2:end); % X-Values of Data Set
B = ptxset(:,2:2:end); % Y-Values of Data Set

x_soma = soma(:,1:2:end);
y_soma = soma(:,2:2:end);


% Find X-dist of each cell to correct soma
% Step 1: Rid of Zero Values and Replace with Inf in X-set 
zero_ind = find(A==0);
A(zero_ind) = inf;
A_corrected = A;
X_dist = (A_corrected-x_soma).^2;

% Find Y-dist of each cell to correct soma
% Step 2: Rid of Zero Values and Replace with Inf in Y-set
zero_ind_y = find(B==0);
B(zero_ind_y) = inf;
B_corrected = B;
Y_dist = (B_corrected-y_soma).^2;

% Step 3: Calculate Distance 
dist = sqrt(X_dist + Y_dist); 

% Step 4: Find Minumum Distance of Each Cell 
min_dist = min(dist);


