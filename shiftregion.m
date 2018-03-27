% Demo to Shift a Region in a Binary Image
fontSize = 14;
grayImage = peaks(200);
subplot(2,2,1);
imshow(grayImage, []);
title('Original Grayscale Image','FontSize',fontSize);
axis on;
% Enlarge figure to full screen
set(gcf, 'units', 'normalized', 'outerposition',[0 0 1 1]); % Maximize Figure

binaryImage = grayImage > 5;
subplot(2,2,2);
imshow(binaryImage, []);
title('Binary Image','FontSize',fontSize);
axis on;

% Find Centroid of Binary Region
measurements = regionprops(binaryImage, 'Centroid');
[rows, columns] = size(binaryImage);
rowsToShift = round(rows/2 - measurements.Centroid(2));
columnsToShift = round(columns/2 - measurements.Centroid(1));

% Call circshift to move region to center
shiftedImage = circshift(binaryImage, [rowsToShift, columnsToShift]);
subplot(2,2,3);
imshow(shiftedImage, []);
title('Shifted Binary Image', 'FontSize', fontSize);
axis on;




