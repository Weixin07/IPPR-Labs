%%% Edge detection: 4 Operators
% Read the grayscale image
A = imread('standard_test_images\Penguins_grey.jpg');
A = rgb2gray(A);

% Read the image and add Gaussian noise
B = imread('standard_test_images\Penguins_grey.jpg');
B = rgb2gray(B);
B_noise = imnoise(B, 'gaussian');

% Prewitt operator on noisy image
prewittEdge = edge(B_noise, 'Prewitt');

% Sobel operator on noisy image
sobelEdge = edge(B_noise, 'Sobel');

% Roberts operator on noisy image
robertsEdge = edge(B_noise, 'Roberts');

% Prewitt operator on noisy image
cannyEdge = edge(B_noise, 'Canny');

%%% Spatial Filtering
%%% Horizontal Edge Detection
entry = imread('standard_test_images\entry2.png');
hz1 = fspecial('sobel');
filter_hz1 = imfilter(double(entry), hz1, 'replicate', 'conv'); % Create filtered image

% Prewitt
hz2 = fspecial('prewitt');
filter_hz2 = imfilter(double(entry), hz2, 'replicate', 'conv'); % Create filtered image

%%% Vertical Edge Detection
% Task 2: Create a zero matrix and apply edge detection
f = zeros(128, 128);
f(32:96, 32:96) = 255;
[g1, t1] = edge(f, 'sobel', 'vertical');

%%% Extra Task for combined edge
entry1 = imread('standard_test_images\two_cats.jpg');
sobel_horizontal = fspecial('sobel');
horizontal_edges = imfilter(double(entry1), sobel_horizontal, 'replicate', 'conv'); 
sobel_vertical = sobel_horizontal'; 
vertical_edges = imfilter(double(entry1), sobel_vertical, 'replicate');
combined_edges = horizontal_edges + vertical_edges;

%%% Thresholding with Histograms
% Load the image
bac = imread('standard_test_images\bacteria_original.tif');
bac = bac(:,:,1:3);

% The threshold value is chosen where a valley between two significant
% peaks (as shown in the histogram)
threshold_value = 123;
c = bac > threshold_value;

% Comparison with the other file
eig = imread('standard_test_images\Eight.tif');
eig = eig(:,:,1:3);
threshold_value = 121;
eigf = eig > threshold_value;

%For Display Purposes
bac1 = imread('standard_test_images\bacteria_original.tif');
bac1 = bac1(:,:,1:3);
eig1 = imread('standard_test_images\Eight.tif');
eig1 = eig1(:,:,1:3);

%Display Results
figure;
subplot(7,4,1), imshow(A), title('Original Image');
subplot(7,4,2), imshow(B_noise), title('Added Noise');
subplot(7,4,5), imshow(prewittEdge), title('Prewitt Edge Operator');
subplot(7,4,6), imshow(sobelEdge), title('Sobel Edge Operator');
subplot(7,4,7), imshow(robertsEdge), title('Rpberts Edge Operator');
subplot(7,4,8), imshow(cannyEdge), title('Canny Edge Operator');
subplot(7,4,9), imshow(entry), title('Original Image');
subplot(7,4,10), imshow(filter_hz, []), title('Negative Values of Spatial Filtering');
subplot(7,4,11), imshow(f), title('Zero Matrix Edge Detection');
subplot(7,4,13), imshow(abs(filter_hz), []), title('Sobel Horizontal');
subplot(7,4,14), imshow(abs(filter_hz), []), title('Prewitt Horizontal');
subplot(7,4,15), imshow(g1), title('Vertical Edge Detection');
subplot(7,4,17), imshow(entry1), title('Original Image');
subplot(7,4,18), imshow(combined_edges), title('Combined Edge Detection');
subplot(7,4,21), imshow(bac1(:, :, 1)), title('Original Image');
subplot(7,4,22), imhist(bac), title('Histogram');
subplot(7,4,23), imshow(c(:, :, 1)), title('Applying Threshold Value:123');
subplot(7,4,25), imshow(eig1(:, :, 1)), title('Original Image');
subplot(7,4,26), imhist(eig), title('Histogram');
subplot(7,4,27), imshow(eigf(:, :, 1)), title('Applying Threshold Value:121');


