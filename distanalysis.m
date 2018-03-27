

A = ptxset(:,1:2:end); % X-Values of Data Set
B = ptxset(:,2:2:end); % Y-Values of Data Set

x_soma = soma(:,1:2:end);
y_soma = soma(:,2:2:end);


dist = cell(1000,1000);

for i = 1:length(A)
    for j = 1:length(B)
   dist{i,j} = sqrt ( (x_soma(i) - A(i))^2 + (y_soma(j) - B(j))^2 );
   
    end 
end
 
dist_final = cell2mat(dist); 

        