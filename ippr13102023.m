%{
x = [150 170 190 190 10 11 12 10; 180 250 170 180 11 13 12 11; 175 160 170 175 13 12 11 12; 175 185 185 170 13 11 10 12; 100 60 100 60 100 60 100 60; 60 100 60 100 60 100 60 100; 100 60 100 60 100 60 100 60; 60 100 60 100 60 100 60 100];
subplot(2,4,1);
imshow(uint8(x));
title('Original');

f2=imfilter(x,(1/9*[1 1 1; 1 1 1; 1 1 1]));
subplot(2,4,3);
imshow(uint8(f2));
title('Smoothing Filter - a');

f3=imfilter(x,[0 1 0; 1 -4 1; 0 1 0]);
subplot(2,4,4);
imshow(uint8(f3));
title('Smoothing Filter - b');
%}

%{
% Laplacian Filtering
img = imread('standard_test_images\moon.png');
img = im2gray(img);
img1 = im2double(img);
lap = [1 1 1; 1 -8 1; 1 1 1];
img2 = conv2(img1, lap, 'same');
img3 = img1 - img2;
figure;
subplot(2,2,1);
imshow(img1);
title('Moon Original Image');

subplot(2,2,2);
imshow(img2);
title('Laplacian Filtered Moon Image Image');

subplot(2,2,3);
imshow(img3);
title('Laplacian-Enhanced Image');
%}

%{
%Using of uint8 during display
f = imread('standard_test_images\infantgray.png');
g = log(1+double(f));
gs = im2uint8(mat2gray(g));

subplot(2,2,1);
imshow(f);
title('Ori');

subplot(2,2,2);
imshow(g);
title('log');

subplot(2,2,3);
imshow(gs);
title('uint8');
%}

%{
%Brightness Enhancement
a = imread('standard_test_images\lena_color_256.tif');
b = double(a) + 50;
imshow(a);
title('Original Image');
figure, imshow(uint8(b)),title('Enhanced Image');
%}

%{
%Brightness Supression
a = imread('standard_test_images\lena_color_256.tif');
b = double(a) - 70;
imshow(a);
title('Original Image');
figure, imshow(uint8(b)),title('Brightness Supressed Image');
%}

%{
% Contrast Manipulation
a = imread('standard_test_images\lena_color_256.tif');
b = rgb2gray(a);
c = b*0.5;
d = b*1.2;
figure, imshow(a), title('Original Image');
figure, imshow(c),title('Increase in Contrast');
figure, imshow(d),title('Decrease in Contrast');
%}

%Basic Two-Dimensional Plot
t = 0:0.01:2;
temp = exp(-t);
plot(t,temp);
xlabel('Time');
ylabel('Temp');
title('Transient Temperatures');

