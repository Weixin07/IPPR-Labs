%{
% Define the grayscale image matrix
grayscaleImage = [
    160 173 90  87  199 201 222;
    56  87  98  54  201 211 198;
    232 44  22  106 108 48  54;
    151 127 59  75  100 79  90;
    124 136 112 109 32  24  81;
    164 111 41  31  93  7   5;
    98  136 80  29  8   16  62
];

% Define the colormap matrix where each row corresponds to a color
colormap = [
    0   0   255;  % A
    0   255 0;    % B
    255 0   0;    % C
    255 255 255   % D
];

% Determine the number of intensity levels for each color slice
levelsPerColor = 256 / size(colormap, 1);
%%% size(colormap, 1): The size function returns the dimensions of the colormap matrix. The first argument of size is the matrix itself, and the second argument, 1, specifies that you want the size of the first dimension of the matrix (which corresponds to the number of rows). If colormap is a matrix where each row represents a color, size(colormap, 1) gives you the number of colors in the colormap.

% Initialize the pseudo-colored image
pseudoColoredImage = zeros(size(grayscaleImage, 1), size(grayscaleImage, 2), 3);

% Apply pseudo-coloring based on intensity
for i = 1:size(grayscaleImage, 1)
    for j = 1:size(grayscaleImage, 2)
        intensity = grayscaleImage(i, j);
        % Determine the color code based on the intensity
        colorCode = floor(double(intensity) / levelsPerColor) + 1;
        % Handle the case where the intensity is at the maximum
        colorCode = min(colorCode, size(colormap, 1));
        % Assign the corresponding color to the pixel
        pseudoColoredImage(i, j, :) = colormap(colorCode, :);
    end
end

% Convert the pseudo-colored image to uint8 for display
pseudoColoredImage = uint8(pseudoColoredImage);

% Display the pseudo-colored image
%imshow(grayscaleImage, []);
imshow(pseudoColoredImage);
%}

% Assuming 'x' is your RGB image
x = imread('IMG_2201.JPG'); 

% Prepare the figure
figure;

% Convert to HSV and display each component
xh = rgb2hsv(x);
subplot(4,4,1), imshow(xh(:,:,1)), title('HSV - Hue');
subplot(4,4,2), imshow(xh(:,:,2)), title('HSV - Saturation');
subplot(4,4,3), imshow(xh(:,:,3)), title('HSV - Value');

% Convert to YCbCr and display each component
xy = rgb2ycbcr(x);
subplot(4,4,4), imshow(xy(:,:,1)), title('YCbCr - Y');
subplot(4,4,5), imshow(xy(:,:,2)), title('YCbCr - Cb');
subplot(4,4,6), imshow(xy(:,:,3)), title('YCbCr - Cr');

% Convert to LAB and display each component
lab = rgb2lab(x);
subplot(4,4,7), imshow(lab(:,:,1)), title('LAB - L');
subplot(4,4,8), imshow(lab(:,:,2)), title('LAB - A');
subplot(4,4,9), imshow(lab(:,:,3)), title('LAB - B');

% Convert to XYZ and display each component
xyz = rgb2xyz(x);
subplot(4,4,10), imshow(xyz(:,:,1)), title('XYZ - X');
subplot(4,4,11), imshow(xyz(:,:,2)), title('XYZ - Y');
subplot(4,4,12), imshow(xyz(:,:,3)), title('XYZ - Z');

% Convert to NTSC and display each component
xn = rgb2ntsc(x);
subplot(4,4,13), imshow(xn(:,:,1)), title('Luminance (Y) Component');
subplot(4,4,14), imshow(xn(:,:,2)), title('Chrominance (I) Component');
subplot(4,4,15), imshow(xn(:,:,3)), title('Chrominance (Q) Component');

subplot(4,4,16), imshow(x), title('Original Image');
% Ensure to maximize the plot window for better visibility
set(gcf, 'WindowState', 'maximized');

%{
% Convert to YUV and display each component
yu = rgb2yuv(x);
subplot(3,4,7), imshow(yu(:,:,1)), title('YUV - Y');
subplot(3,4,8), imshow(yu(:,:,2)), title('YUV - U');
subplot(3,4,9), imshow(yu(:,:,3)), title('YUV - V');

% Convert to CMYK and display each component
cmyk = rgb2cmyk(x); % You may need a custom function for this as MATLAB does not have a built-in function
subplot(4,4,16), imshow(cmyk(:,:,1)), title('CMYK - C');
subplot(4,4,17), imshow(cmyk(:,:,2)), title('CMYK - M');
subplot(4,4,18), imshow(cmyk(:,:,3)), title('CMYK - Y');
subplot(4,4,19), imshow(cmyk(:,:,4)), title('CMYK - K');

% Convert to HSL and display each component
hsl = rgb2hsl(x); % You may need a custom function for this as MATLAB does not have a built-in function
subplot(4,4,20), imshow(hsl(:,:,1)), title('HSL - Hue');
subplot(4,4,21), imshow(hsl(:,:,2)), title('HSL - Saturation');
subplot(4,4,22), imshow(hsl(:,:,3)), title('HSL - Lightness');

%}




