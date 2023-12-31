%To Adjust Quality
%{
I = imread('standard_test_images/Peppers.png');
imwrite(I, 'pep75.jpg');
imwrite(I, 'pep05.jpg', 'quality', 5);
imwrite(I, 'pep95.jpg', 'quality', 95);

figure,subplot(221),imshow(I);

I_05=imread('standard_test_images/pep05.jpg'); subplot(222), imshow(I_05);
I_75=imread('standard_test_images/pep75.jpg'); subplot(223), imshow(I_75);
I_95=imread('standard_test_images/pep95.jpg'); subplot(224), imshow(I_95);
%}

%To Implement Contrast Stretching
%https://www.mathworks.com/help/images/ref/imadjust.html
%{
img = imread('standard_test_images/Rachmaninoff.jpg');
gray = rgb2gray(img)
adj_img = imadjust(gray, [0.3,0.7],[]);
subplot(121);
imshow(gray);
title('input');
subplot(122);
imshow(adj_img);
title('adjusted');
%}

%Histogram Equalizaiton
%https://www.mathworks.com/help/images/ref/histeq.html
%{
a = imread('standard_test_images/lena_color_256.tif');
subplot(2,4,1);
imshow(a);
title('input image');

b=rgb2gray(a);
subplot(2,4,2);
imshow(b);
title('grayscale image');

subplot(2,4,3);
imhist(b);
title('histogram image');

d=histeq(b);
subplot(2,4,4);
imshow(d)
title('histogram equalization');
%}

%Adding Noise
%{
x = imread('standard_test_images/cameraman.tif');
subplot(2,4,1);
imshow(x);
title('Original');

%Noise: Salt & Pepper
x1 = imnoise(x,'salt & pepper',0.05);
subplot(2,4,2);
imshow(x1);
title('S&P - 0.05');
x12 = imnoise(x,'salt & pepper',0.2);
subplot(2,4,3);
imshow(x2);
title('S&P - 0.2');
x13 = imnoise(x,'salt & pepper',0.5);
subplot(2,4,4);
imshow(x3);
title('S&P - 0.5');
x14 = imnoise(x,'salt & pepper',0.35);
subplot(2,4,5);
imshow(x14);
title('S&P - 0.35');

%Noise = Gaussian
x2=imnoise(x,'gaussian',0.01);
subplot(2,4,3);
imshow(x2);

%Noise: Speckle
x3=imnoise(x,'speckle',0.04);
subplot(2,4,4);
imshow(x3);
%}

%Filtering
%https://www.mathworks.com/help/images/ref/ordfilt2.html

x = imread('standard_test_images/cameraman.tif');
subplot(2,4,1);
imshow(x);
title('Original');

%medfilt"2" means for 2D images - greyscale
f1=medfilt2(x,[3 3]);
subplot(2,4,2);
imshow(f1);
title('Median Filter');

%https://www.mathworks.com/help/images/ref/ordfilt2.html
%5,ONES(3,3) 3x3 median filter
f2=ordfilt2(x,5,[1 1 1; 1 1 1; 1 1 1]);
subplot(2,4,3);
imshow(f2);
title('Order-Statistic Filter - Median');

%1,ONES(3,3) 3x3 minimum filter
f3=ordfilt2(x,1,ones(3,3));
subplot(2,4,4);
imshow(f3);
title('Order-Statistic Filter - Minumum');

%9,ONES(3,3) 2x2 max filter
f4=ordfilt2(x,9,ones(3,3));
subplot(2,4,5);
imshow(f4);
title('Order-Statistic Filter - Maximum');

%4,[0 1 0; 1 0 1; 0 1 0] replaces each element in A by the maximum of its north, east, south, and west neighbours.
f5=ordfilt2(x,4,[0 1 0; 1 0 1; 0 1 0]);
subplot(2,4,6);
imshow(f5);
title('Order-Statistic Filter - All 4 Directions');







