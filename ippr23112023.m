%%% Combining Colours with Frayscale Images
%% Method 1
% Adding Dimensions
grayimg = imread("standard_test_images\saturn.tif");
colorimg = cat(3,grayimg,grayimg,grayimg);

% Adding Colours
%{
row=305;
col=330;
colorimg(row-5:row+5,col,1) = 256;
colorimg(row-5:row+5,col,2) = 0;
colorimg(row-5:row+5,col,3) = 0;

colorimg(row:row+5,col+5,1) = 256;
colorimg(row:row+5,col+5,2) = 0;
colorimg(row:row+5,col+5,3) = 0;
figure, imshow(colorimg);
%}

red = [ 256 0 0];
for dim = 1:3
    colorimg(row-5:row+5,col,dim) = red(dim);
    colorimg(row:row-5,col,dim) = red(dim);
end
figure, imshow(colorimg);



