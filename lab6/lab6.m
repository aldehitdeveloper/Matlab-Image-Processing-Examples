%% Question 1 - 2 
x = (imread('circuit-board-pepper.tif')); %read image for double 
x=double(x);%convert orginal image double for calculations
figure
subplot(2,2,1)
imshow(uint8(x)) %orginal image 
title('orginal image')
max = ordfilt2(x,9,ones(3,3)); %for pepper noise prefered max filter 
subplot(2,2,2)
imshow(uint8(max))
title('max filter')

x = (imread('circuit-board-salt.tif')); %read image for double 
x=double(x);%convert orginal image double for calculations
subplot(2,2,3)
imshow(uint8(x)) %orginal image 
title('orginal image')
min = ordfilt2(x,1,ones(3,3)); %for salt noise prefered min filter 
subplot(2,2,4)
imshow(uint8(min))
title('min filter')


%% Question 3
n1 = (imread('pattern_noise1.tif')); %Gaussian
n2 = (imread('pattern_noise2.tif')); %Rayleigh
n3 =(imread('pattern_noise3.tif')); %Erlang

figure 
subplot(3,2,1)
imshow(uint8(n1))
title('Orginal Image-noise1')
subplot(3,2,2)
imhist(n1)
title('Histogram-Rayleigh')

subplot(3,2,3)
imshow(uint8(n2))
title('Orginal Image-noise2')
subplot(3,2,4)
imhist(n2)
axis tight
title('Histogram-Erlang')

subplot(3,2,5)
imshow(uint8(n3))
title('Orginal Image-noise3')
subplot(3,2,6)
imhist(n3)
axis tight
title('Histogram-Gaussian')


%% Question 4 
figure
q4 = (imread('pattern.tif')); 
q4noised= imnoise(q4,'salt & pepper'); %salt and pepper noise 

subplot(2,2,1)
imshow(uint8(q4))
title('Orginal Image')

subplot(2,2,2)
imhist(q4)
axis tight
title('Orginal Image Histogram')

subplot(2,2,3)
imshow(q4noised)
title('Noised Image')

subplot(2,2,4)
imhist(q4noised)
axis tight
title('Noised Image Histogram')


%In histogram we can see easly because pixel count is so big for this zoom
%the histogram at 255 point.Orginal photo doesnt have white pixel however
%noised image has some white pixel 
%Salt and pepper shape is impulse 

%% Question 5 
figure
q5 = (imread('pattern.tif')); %Gaussian
q5noised=  imnoise(q5,'gaussian',0,0.01); %Gaussian add noise 

subplot(2,2,1)
imshow(uint8(q5))
title('Orginal Image')

subplot(2,2,2)
imhist(q5)%Histogram orginal image 
title('Orginal Image Histogram')

subplot(2,2,3)
imshow(q5noised)
title('Noised Image')

subplot(2,2,4)
imhist(q5noised)%Histogram noised image 
title('Noised Image Histogram')

%Normally orginal image has 3 different color and in histogram show this
%fact.After add the noise color distributed and histogram looks like a wave
%because in orginal image has 3 different after the gaussian distribution
%all color value has some value.We know the gaussian shape and 
%Fourth question we add salt and pepper noise and this question add
%gaussian noise and in same image 2 different histogram.Also gaussian
%historam is continios because the gaussian distirbution.
