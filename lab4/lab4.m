%Author : Bekir BOSTANCI 
%ID : 20150607020

x = im2double(imread('skeleton_orig.tif')); %read image 
x = x *255;

filter = [0 -1 0; -1 5 -1 ; 0 -1 0];%designe laplace filter 

ILaplace = conv2(x,filter,'same');%convolve laplace filter with orginal image

figure
imshow(uint8(ILaplace))
title('Laplace')

Gx=[-1 -2 -1 ; 0 0 0 ; 1 2 1];%design Sobel Filter x 
Gy=[-1 0 1 ; -2 0 2 ;-1 0 1];%design Sobel Filter y

G1 = conv2(x,Gx,'same');%convolve orginal image with sobelx matrix 
G2 = conv2(x,Gy,'same');%convolve orginal image with sobely matrix 

ISobel = abs(G1)+abs(G2); %sum of vertical and horizatel filtered image that is approximation 

figure
imshow(uint8(ISobel))
title('Sobel Filtered Image')

filterA= ones(5,5)/5^2;%create 5x5 average filtered 
IAverage = conv2(ISobel,filterA,'same');%apply average filter on sobel filtered image 

figure
imshow(uint8(IAverage))
title('Averaged')

IMask= (IAverage .* ILaplace )/255;%Production sobbel average image with laplaced image 

figure
imshow(uint8(IMask))
title('Mask')

ISummed = IMask + x;%sum mask with orginal image 
 
IFinal = ((ISummed./255).^0.5).*255;%Firstly normalize image and than get power after this multiply with 255 for normal image 

figure 
imshow(uint8(abs(IFinal))); %average filtered image 
title('Final Image')

