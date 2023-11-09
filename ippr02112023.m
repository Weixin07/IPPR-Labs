% Given matrix
A = [199, 230, 240, 251, 234;
     192, 209, 160, 184, 207;
     185, 170, 120, 146, 39;
     130, 101, 63, 52, 28;
     117, 89, 44, 19, 3];

% Binary thresholding
binary_image = A > 150;

% Multi-level thresholding
multi_level_image = zeros(size(A));
multi_level_image(A <= 55) = 0;
multi_level_image(A > 55 & A <= 190) = 0.5;
multi_level_image(A > 190) = 1;

% Display Result
figure;
subplot(1,3,1);
imshow(binary_image);
title('Binary Image with T=150');

subplot(1,3,2);
imshow(multi_level_image, []);
title('Multi-level Image with T1=55 and T2=190');

