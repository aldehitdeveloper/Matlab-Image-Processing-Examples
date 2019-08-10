%% 1 question  
%1-1 question
n=11;
x = (imread('checker.tif')); %read image for double 
x=double(x);
d = padarray(x,[11 11],0); %add 11x11 black border(matrix) around to orginal image 
filter = ones(23)/23^2;%create filter 
c = conv2(d,filter,'same');%convolve to filter 

first_image = c(n+1:end-n,n+1:end-n);%remove pad
subplot(2,2,1);%show image 
imshow(uint8(first_image))
title("“zeros”")

%1-2 question
%it is same for 1-1 only changed pad color black to white 
d = padarray(x,[11 11],255);
c = conv2(d,filter,'same');
second_image = c(n+1:end-n,n+1:end-n);
subplot(2,2,2);
imshow(uint8(second_image))
title("“255”")

%1-3 question
%it is same for 1-1 there is a only one differences
%there is not a color there is a symmetric matrix
d = padarray(x,[11 11],'symmetric');
c = conv2(d,filter,'same');
third_image = c(n+1:end-n,n+1:end-n);

subplot(2,2,3);
imshow(uint8(third_image))
title("“symmetric”")



%% 2 question 
%2-1 
x = (imread('hubble_orig.tif')); %read image for double 
x=double(x);%convert orginal image double for calculations
filter = ones(15)/15^2;%create 15x15 filter 
c = conv2(x,filter,'same');%convolve to orginal image 

%threash hold part
y=c;%for dont change the orginal message export another variable
y(y > 60) = 255;%give a condition and equal new value
y(y <= 60) = 0;%less than another condition give another value 

%print part 
figure 
subplot(2,3,1);
imshow(uint8(x))
title('orginal')

subplot(2,3,2);
imshow(uint8(c))
title('filtred 15x15')


subplot(2,3,3);
imshow(uint8(y));
title('thresholded')

%2-2
filter = ones(31)/31^2;
c = conv2(x,filter,'same');

y=c;%for dont change the orginal message export another variable
y(y > 60) = 255;%give a condition and equal new value
y(y <= 60) = 0;%less than another condition give another value 

subplot(2,3,4);
imshow(uint8(x))
title('orginal')

subplot(2,3,5);
imshow(uint8(c))
title('filtred 31x31')

subplot(2,3,6);
imshow(uint8(y));
title('thresholded')

%conculusion of 2. part 
%for with logic as we can see bigger filter size image more blur that
%smaller sized filtered image 
%For this resason after the filtring process threshold area decreased
%because image based darker color so that after the average filter decrease
%the white area 

%% 3 question 
x = imread('board.tif'); %read image for double 
y=double(x);
y_1=medfilt2(y);%filtered with median filter 

%print part 
figure
subplot(2,1,1)
imshow(uint8(y_1))
title('medfilt2 3x3')

%average filter 
filter = ones(3)/3^2;
y_2= conv2(x,filter,'same');
subplot(2,1,2)
imshow(uint8(y_2))
title('average filter 3x3')

%conculusion of 3. part 
%for this exampled image we should use median filter because avegare filter
%increase the noise.This is because there is a so much point and filter
%size is too small for filter so that for every calculation pixels are
%polluting 