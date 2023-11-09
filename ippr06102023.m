
%imfilter: 3D Filtering
%filter2: 2D Filtering

%3D Filtering
%Default Correlation if not specified
%Smoothing
%https://www.mathworks.com/help/images/ref/imfilter.html#btsmcj2-1-h
%{
x = imread('standard_test_images/cameraman.tif');
subplot(2,4,1);
imshow(x);
title('Original');


f1=imfilter(x,(1/9*ones(3,3)));
subplot(2,4,2);
imshow(f1);
title('Smoothing Filter - a');

f2=imfilter(x,(1/10*[1 1 1; 1 2 1; 1 1 1]));
subplot(2,4,3);
imshow(f2);
title('Smoothing Filter - b');

f3=imfilter(x,(1/16*[1 2 1; 2 4 2; 1 2 1]));
subplot(2,4,4);
imshow(f3);
title('Smoothing Filter - c');

%Convolution
f7=imfilter(x,([1 2 3; 4 5 6; 7 8 9]/45),'conv');
subplot(2,4,5);
imshow(f7);
title('Smoothing Filter - Convolution');

%Sharpening
f4=imfilter(x,[-1 -1 -1; -1 9 -1; -1 -1 -1]);
subplot(2,4,6);
imshow(f4);
title('Sharpening Filter - a');

f5=imfilter(x,[1 -2 1; -2 5 -2; 1 -2 1]);
subplot(2,4,7);
imshow(f5);
title('Sharpening Filter - b');

f6=imfilter(x,[0 -1 0; -1 5 -1; 0 -1 0]);
subplot(2,4,8);
imshow(f6);
title('Sharpening Filter - c');
%}

%Edge Detection - Sobel
%{
H1 = fspecial('sobel');
edgeSobel = imfilter(x,H1)
subplot(2,4,2);
imshow(edgeSobel);
title('Edge Detection - Sobel Operation');
%}

%2D Filtering
%{
I = imread("standard_test_images\rice.jpg");
I = im2gray(I);
J = imnoise(I, 'salt & pepper', 0.02);
K = fspecial('average');
J1 = filter2(K,J);
figure(1), imshow(I);
figure(2), imshow(J);
figure(3), imshow(uint8(J1));
%}

%Brightness Enhancement
%{
a = imread('standard_test_images\lena_color_256.tif');
b = double(a) + 50;
imshow(a);
title('Original Image');
figure, imshow(uint8(b)),title('Enhanced Image');
%}

%fspecial Functionalities
%https://www.mathworks.com/help/images/ref/fspecial.html
%{
cat = imread('standard_test_images\cat_orig.png');
figure, imshow(cat);

%Motion Blurring
h = fspecial('motion', 20, 45);
catMotion = imfilter(cat,h);
figure,imshow(catMotion);

%Sharpening
h = fspecial('unsharp');
catSharp = imfilter(cat,h);
figure, imshow(catSharp);

%Horizontal Edge-Detection
h = fspecial('sobel');
catSobel = imfilter(cat,h);
figure,imshow(catSobel);
%}

%Smoothing and Median Filtering
img1 = imread('standard_test_images\circuit_board.png');
img1 = im2gray(img1);
img2 = im2double(img1);
h = ones(3,3)/(3^2);
img2 = conv2(img2, h, 'same');
img3 = medfilt2(img2,[3,3]);

figure;

subplot(1,3,1);
imshow(img1);
title('Original');

subplot(1,3,2);
imshow(img2);
title('3X3 Smoothing Filter');

subplot(1,3,3);
imshow(img3);
title('3X3 Median Filter');





