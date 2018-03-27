% Concentric Polygon Practice
% Demo to draw shrinking polygons

fontSize = 20;
image1 = crop_test;
subplot(2,2,1); imshow(image1); 
data = cell(1,1000);

for k = 1:length(b)
    boundary = b{k};
    data{k} = boundary; 
    hold on; plot(boundary(:,2),boundary(:,1),'r','Linewidth',2);
    
end

title('Your Image','FontSize',fontSize);
%Enlarge figure to full screen
set(gcf,'Position',get(0,'Screensize'));
set(gcf,'name','Demo','numbertitle','off');

% Give Instructions
%message = sprintf('Left-click the vertices.\nRight-click (or double left-click) the very last vertex to finish the polygon');
%uiwait(msgbox(message));
% Have user draw a polygon
%[mask,x,y] = roipoly;
mask = ch;
% Display the polygon
%hold on;
%plot(x,y,'LineWidth',2);
subplot(2,2,2); imshow(mask,[]); 
data = cell(1,1000);

for k = 1:length(b)
    boundary = b{k};
    data{k} = boundary; 
    hold on; plot(boundary(:,2),boundary(:,1),'r','Linewidth',2);
    
end
title('Mask','FontSize',fontSize);

% Calculate the distance transform
distanceTransform = bwdist(~mask);
subplot(2,2,3); imshow(distanceTransform, []); title('Distance Transform','FontSize',fontSize);
% Biggest distance to an edge
maxValue = max(distanceTransform(:));

% Calculate successive shrinking polygons by
% looking for specific values of the distance transform.
subplot(2,2,4);
for gl = 1 : 10: floor(maxValue)
% Get the polygon that is smaller than the previous one.
mask1 = distanceTransform > gl;
% Display it.
imshow(mask1, []); title('Interior polygon', 'FontSize', fontSize);

% Prompt user if they want to continue.
promptMessage = sprintf('Iteration %d', gl);
button = questdlg(promptMessage, 'Continue', 'Continue', 'Cancel','Continue');
drawnow;
if strcmp(button, 'Cancel')
break;
end
end


    
    
    










