% Colour Image Processing
im = imread("standard_test_images\lena_color_512.tif");
[m, n, o]=size(im);
R = cat(3, im(:,:,1), zeros(n), zeros(n));
G = cat(3, zeros(n), im(:,:,2), zeros(n));
B = cat(3, zeros(n), zeros(n), im(:,:,3));
subplot(3,4,1), imshow(im), title('Original Image');
subplot(3,4,2), imshow(R), title('Red Channel');
subplot(3,4,3), imshow(G), title('Green Channel');
subplot(3,4,4), imshow(B), title('Blue Channel');

% 2. %RGB --> CMY
f1 = cat(3, im(:,:,1), im(:,:,2)*0+255, im(:,:,3)*0+255);
f2 = cat(3, im(:,:,1)*0+255, im(:,:,2) , im(:,:,3)*0+255);
f3 = cat(3, im(:,:,1)*0+255, im(:,:,2)*0+255, im(:,:,3));
subplot(3,4,5), imshow(im), title('Original Image');
subplot(3,4,6), imshow(f1), title('Cyan Channel');
subplot(3,4,7), imshow(f2), title('Magenta Channel');
subplot(3,4,8), imshow(f3), title('Yellow Channel');

% 3. %Color Image Enhancement - Contrast
En = cat(3, im(:,:,1)./2,im(:,:,2)./2,im(:,:,3)./2);
subplot(3,4,9), imshow(En), title('Colour Image Enhancement');

% 4. %Colour Image Edge Detection
img1=rgb2ycbcr(im);
dx1=edge(img1(:,:,1),'canny');
dx1=(dx1*255);
img2(:,:,1)=dx1;
img2(:,:,2)=img1(:,:,2);
img2(:,:,3)=img1(:,:,3);
rslt=ycbcr2rgb(uint8(img2));
subplot(3,4,10), imshow(rslt), title('Colour Edge Detection');

% Color image segmentation
Im = imread("standard_test_images\beach.tif");
R = Im(:,:,1);
G = Im(:,:,2);
B = Im(:,:,3);
[H,S,I] = rgb2hsv(R,G,B);
Sh = ((H>0.49)+(H<0.08))>0;
Sh = double(bwmorph(Sh,'dilate',3));
Sh = double(bwmorph(Sh,'erode',3));
subplot(3,4,11), imshow(Sh), title('Colour Image Segmentation');
