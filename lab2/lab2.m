%First assigment
x = imread('breast_Xray.tif');%read image file 
y = 255 - x ;%get negative version minus 255
figure 
imshow(uint8(y)); %show image
title('First assigment')
clear 
 

%Seccond Assigment
x = im2double(imread('moon.tif')); %read image for double 
x=x*255;%that is normalize version so that multiply 255
y=x;%for dont change the orginal message export another variable
y(y > 60) = 255;%give a condition and equal new value
y(y <= 60) = 0;%less than another condition give another value 

figure
imshow(uint8(y));%show image
title('Second assigment')

clear 
 

%Third Assigment
load('barbara_dft_no_log.mat');%load data 
x=barbara_dft_no_log;%for easy use export other variable 
final = log(1+x);%get log value but log(0) is - infinity so that add 1
figure 
imshow(final,[]);%show image 
title('Third assigment')
clear 
 

%Fourth Assigment 

x = im2double(imread('washed_aerial.tif')); %read image 

y = ((x).^2).*255;%get power element by element and  times 255 this is function 

%plot image 
figure
subplot(1,3,1)
imshow(uint8(y));
title('Gama 2')

y = ((x).^3).*255;%get power and function and plot again
subplot(1,3,2)
imshow(uint8(y));
title('Gama 3')

y = ((x).^4).*255;
subplot(1,3,3)
imshow(uint8(y));
title('Gama 4')
 
clear 

%Fifth Assigment 
x = im2double(imread('fractured_spine.tif'));%read image 
y = ((x).^0.3).*255;

figure
subplot(1,3,1)
imshow(uint8(y));
title('game 0.3');

y = ((x).^0.4).*255;
subplot(1,3,2)
imshow(uint8(y));
title('game 0.4');

y = ((x).^0.5).*255;
subplot(1,3,3)
imshow(uint8(y));
title('game 0.5');

clear


%Sixth Assigment 
x = double(imread('fractal_iris.tif')); %read data 
figure 
for i=1:8 %count every layer 

    subplot(2,4,i)
    b = bitget(x,i);%for every layer get data for bitget and draw 
    imshow(b)
    title(i)
end



