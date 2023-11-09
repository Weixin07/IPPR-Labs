%{
%%%FFT
%Create a white rectangle with black background
f = zeros(30,30);
f(5:24,13:17) = 1;
imshow(f, 'InitialMagnification', 'fit');

%Calculate the DFT
F=fft2(f);
F2=abs(F);
figure, imshow(F2,[],'InitialMagnification','fit');

%Creating a finer sampling with zero padding
F=fft2(f,256,256);
F2=abs(F);
figure, imshow(F2,[]);

%Display the zero-frequency coefficient in the centre
F2=fftshift(F);
F2=abs(F2);
figure,imshow(F2,[]);

%Brightening the Display
F2=log(1+F2);
figure,imshow(F2,[]);
%The reason why [] is used in imshow is so that it maps the minimum value
%%in the image to black; the maximum value to white
%}

%{
%%%Filtering in Frequency Domain (Ideal Filter)
%Ideal Lowpass Filter - It will product a 256*256 filter matrix
[x,y]=meshgrid(-128:127,-128:127);
z=sqrt(x.^2+y.^2);
h=(z<15);

%Transforming the image to the frequency domain (Low requencies to move the
%the centre of the image)
img = imread('standard_test_images\cameraman.tif');
imgF=fftshift(fft2(img));

%Log for better display
imgFr=log(1+abs(imgF));
figure,imshow(mat2gray(imgFr));

%resizing
imgF=imresize(imgF,size(h));

% Low Pass Filtering
lpf=imgF.*h;
lpfl=log(1+abs(lpf));
figure,imshow(mat2gray(lpfl));

%Shift the inverse transformed image back to display actual result
lpfimg=ifft2(ifftshift(lpf));
figure,imshow(mat2gray(abs(lpfimg)));
%}

%{
%%% Filtering with Butterworth Filter
% Butterworth Low Pass Filter
[x, y] = meshgrid(-128:127, -128:127);
% Medium Cut Off Frequency
b1 = 1 ./ (1 + (sqrt(x.^2 + y.^2) / 25).^(2 * 2));
% Lower Cut Off Frequency
b2 = 1 ./ (1 + (sqrt(x.^2 + y.^2) / 5).^(2 * 2));
% Higher Cut Off Frequency
b3 = 1 ./ (1 + (sqrt(x.^2 + y.^2) / 65).^(2 * 2));
% Lower Order
b4 = 1 ./ (1 + (sqrt(x.^2 + y.^2) / 15).^(2 * 1));
% Medium Order
b5 = 1 ./ (1 + (sqrt(x.^2 + y.^2) / 15).^(2 * 5));
% Higher Order
b6 = 1 ./ (1 + (sqrt(x.^2 + y.^2) / 15).^(2 * 20));

% Transforming the image to the frequency domain (Low frequencies to move the
% centre of the image)
img = imread('standard_test_images/cameraman.tif');
imgF = fftshift(fft2(img));

% Resizing
imgF = imresize(imgF, size(b1));

% Low Pass Filtering
% Standard
lpf = imgF .* b1;
% Lower Cut Off Filtering
lpf2 = imgF .* b2;
% Higher Cut Off Filtering
lpf3 = imgF .* b3;
% Lower Order
lpf4 = imgF .* b4;
% Medium Order
lpf5 = imgF .* b5;
% Higher Order
lpf6 = imgF .* b6;

% Shift the inverse transformed image back to display actual result
lpfimg = ifft2(ifftshift(lpf));
lpfimg = abs(lpfimg); % Take the absolute value to get the magnitude
lpfimg = mat2gray(lpfimg); % Normalize the image for display

lpfimg2 = ifft2(ifftshift(lpf2));
lpfimg2 = abs(lpfimg2);
lpfimg2 = mat2gray(lpfimg2);

lpfimg3 = ifft2(ifftshift(lpf3));
lpfimg3 = abs(lpfimg3);
lpfimg3 = mat2gray(lpfimg3);

lpfimg4 = ifft2(ifftshift(lpf4));
lpfimg4 = abs(lpfimg4);
lpfimg4 = mat2gray(lpfimg4);

lpfimg5 = ifft2(ifftshift(lpf5));
lpfimg5 = abs(lpfimg5);
lpfimg5 = mat2gray(lpfimg5);

lpfimg6 = ifft2(ifftshift(lpf6));
lpfimg6 = abs(lpfimg6);
lpfimg6 = mat2gray(lpfimg6);

% Display the images
subplot(2, 3, 1);
imshow(lpfimg2);
title('Lower Cut Off Frequency');

subplot(2, 3, 2);
imshow(lpfimg);
title('Medium Cut Off Frequency - Standard');

subplot(2, 3, 3);
imshow(lpfimg3);
title('Higher Cut Off Frequency');

subplot(2, 3, 4);
imshow(lpfimg4);
title('Lower Order');

subplot(2, 3, 5);
imshow(lpfimg5);
title('Medium Order');

subplot(2, 3, 6);
imshow(lpfimg6);
title('Higher Order');
%}

%{
%%%Filtering with Gaussian Filters
%MATLAB's prediffined gaussian filter
g1 = fspecial('gaussian',256,10);
g2 = fspecial('gaussian',256,5);
g3 = fspecial('gaussian',256,30);

%Transforming the image to the frequency domain (Low requencies to move the
%the centre of the image)
img = imread('standard_test_images\cameraman.tif');
imgF=fftshift(fft2(img));

%Log for better display
imgFr=log(1+abs(imgF));
%figure,imshow(mat2gray(imgFr));

%resizing
imgF1=imresize(imgF,size(g1));

% Low Pass Filtering
lpf1=imgF1.*g1;
lpf2=imgF1.*g2;
lpf3=imgF1.*g3;

%Shift the inverse transformed image back to display actual result
lpfimg = ifft2(ifftshift(lpf1));
lpfimg2 = ifft2(ifftshift(lpf2));
lpfimg3 = ifft2(ifftshift(lpf3));

% Display results in a plot
subplot(1,3,1);
imshow(mat2gray(abs(lpfimg)));
title('Medium Standard Deviation Values');
subplot(1,3,2);
imshow(mat2gray(abs(lpfimg2)));
title('Lower Standard Deviation Values');
subplot(1,3,3);
imshow(mat2gray(abs(lpfimg3)));
title('Higher Standard Deviation Values');
%}