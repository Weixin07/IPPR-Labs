P1 = imread('standard_test_images/1.png')
P2 = imread('standard_test_images/2.png')
P3 = imread('standard_test_images/3.png')

P1=imresize(P1,[256 256])
P2=imresize(P2,[256 256])
P3=imresize(P3,[256 256])

A = imadd(P1,P2)
A2=imadd(A,P3)

subplot(1,4,1)
imshow(P1)
subplot(1,4,2)
imshow(P2)
subplot(1,4,3)
imshow(P3)
subplot(1,4,4)
imshow(A2)