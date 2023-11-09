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
