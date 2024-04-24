% Read and display the image
image = imread('standard_test_images\BerkeleyTower.png');
imshow(image);
title('Original Image');

% Convert the image to grayscale
graylmage = rgb2gray(image);
figure;
imshow(graylmage);
title('Grayscale Image');

% Apply image smoothing using a Gaussian filter   
smoothedImage = imgaussfilt(graylmage, 3);       
figure;
imshow(smoothedImage);
title('Smoothed Image');

% Perform edge detection using the Canny algorithm
edgelmage = edge(smoothedImage, 'Canny');
figure;
imshow(edgelmage);
title('Edges');

% Perform basic image segmentation using thresholding
threshold = graythresh(smoothedImage);
binaryImage = imbinarize(smoothedImage, threshold);
figure;
imshow(binaryImage);
title('Binary Image');

% Perform connected component analysis
labeledImage = bwlabel(binaryImage);
numRegions = max(labeledImage(:));
fprintf('Number of regions: %d\n', numRegions);

% Display each region with a different color
coloredLabels = label2rgb(labeledImage, 'hsv', 'k', 'shuffle');
figure;
imshow(coloredLabels);
title('Connected Components');

% Extract properties of each region
regionProps = regionprops(labeledImage, 'Area', 'BoundingBox', 'Centroid');

% Display the properties of each region
for i= 1:numRegions
fprintf('Region %d:\n', i);
fprintf('Area: %d\n', regionProps(i).Area);
fprintf('Bounding Box: %s\n', mat2str(regionProps(i).BoundingBox));
fprintf('Centroid: %s\n', mat2str(regionProps(i).Centroid));
fprintf('\n');
end