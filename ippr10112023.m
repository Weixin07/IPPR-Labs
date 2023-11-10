%{
%Erosion and Dilation
% Program for morphological operations: Erosions & Dilation
f=imread('standard_test_images\coins.png');
B=[0 1 1; 1 1 1; 0 1 0];
f1=imdilate(f,B);
se=strel('disk',10);
f2=imerode(f,se);
figure,imshow(f)
title('input image');
figure,imshow(f1)
title('dilated image');
figure,imshow(f2)
title('eroded image');

%Opening and Closing
f=imread('standard_test_images\coins.png');
se=strel('square',20);
fo=imopen(f,se);
figure,imshow(f)
title('input image');
figure,imshow(fo)
title('opening of input image');
fc=imclose(f,se);
figure,imshow(fc)
title('opening of input image');
foc=imclose(fo,se);
figure,imshow(foc)
title('closing of opened input image');
%}

% Calculating Dilation & Erosion
A=[0 0 0 0 0 0 0 0; 0 0 0 1 1 1 1 0; 0 0 0 1 1 1 1 0; 0 1 1 1 1 1 1 0; 0 1 1 1 1 1 1 0; 0 1 1 1 1 0 0 0; 0 1 1 1 1 0 0 0; 0 0 0 0 0 0 0 0];
B1=ones(3*3);
B2=[0 1 0; 1 1 1; 0 1 0];

%erosion
e1=imerode(A,B1);
e2=imerode(A,B2);

%dilation
d1=imdilate(A,B1);
d2=imdilate(A,B2);

%Calculating Opening
C=[1 1 1 0 0 0; 1 1 1 0 0 0; 1 1 1 1 0 0; 0 0 1 1 1 1; 0 0 0 1 1 1; 0 0 0 1 1 1];
B3=[0 1 0; 1 1 1; 0 1 0];

d3=imopen(C,B3);

%Calculating Closing
D=[0 0 0 0 0 0 0; 0 1 1 1 0 1 0; 0 1 0 1 0 0 0; 0 1 1 1 0 1 0; 0 0 0 0 0 0 0; 0 1 1 1 1 0 0; 0 0 0 0 0 0 0];
B4=[0 1 0; 1 1 1; 0 1 0];

d4=imclose(D,B4);

%Display Results
figure;
subplot(6,4,1), imshow(A), title('Image A');
subplot(6,4,2), imshow(B1), title('Structuring Element B1');
subplot(6,4,3), imshow(B2), title('Structuring Element B2');
subplot(6,4,5), imshow(e1), title('Erosion with B1');
subplot(6,4,6), imshow(e2), title('Erosion with B2');
subplot(6,4,7), imshow(d1), title('Dilation with B1');
subplot(6,4,8), imshow(d2), title('Dilation with B2');
subplot(6,4,9), imshow(C), title('Image C');
subplot(6,4,10), imshow(B3), title('Cross Structuring Element');
subplot(6,4,13), imshow(d3), title('Opening with C');
%%% There is no difference for the opening operation. It is due to the
%%% structuring element matching with Image C perfectly.

subplot(6,4,17), imshow(D), title('Image D');
subplot(6,4,18), imshow(B4), title('Cross Structuring Element');
subplot(6,4,21), imshow(d4), title('Closing with D');
%%% The middle parts of Image D has turned into white. Showing that the
%%% structuring element has succeeded in closing image D.



