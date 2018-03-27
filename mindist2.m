
for i = 1:length(A)
    x = A(:,i);
    y = B(:,i);

% go to complex vector representation
z = x + i*y;

% find distances between all pairs
a = kron(z, ones(1, length(z)));
b = kron(z.', ones(size(z)));
zdist = abs(a-b);

% only need to look in lower triangle for symmetric pair-wise dists
mindist = min(zdist(tril(zdist)~=0));
%row and col; will contain indexes for the pair, but only need to keep one
[row, col] = find(zdist==mindist);

%plot
figure;
scatter(real(z), imag(z), '.b');
hold on;
scatter(real(z(row)), imag(z(row)), 'or');
hold off;

end
