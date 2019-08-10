%First assigment
x = imread('breast_Xray.tif');%read image file 
y = 255 - x ;%get negative version minus 255

imshow(uint8(y)); %show image

clc
clear 
close all 

%Seccond Assigment
x = im2double(imread('moon.tif')); %read image for double 
x=x*255;%that is normalize version so that multiply 255
y=x;%for dont change the orginal message export another variable
y(y > 60) = 255;%give a condition and equal new value
y(y <= 60) = 0;%less than another condition give another value 

imshow(uint8(y));%show image

clc
clear 
close all 

%Third Assigment
load('barbara_dft_no_log.mat');%load data 
x=barbara_dft_no_log;%for easy use export other variable 
final = log(1+x);%get log value but log(0) is - infinity so that add 1
imshow(final,[]);%show image 



clc
clear 
close all 

%Fourth Assigment 
%for dont write again and again same code I write a function get a gama and
%file name parametre
subplot(3,1,1)
y=getImage('washed_aerial.tif',2);
imshow(uint8(y));


subplot(3,1,2)
y=getImage('washed_aerial.tif',3);
 imshow(uint8(y));


subplot(3,1,3)
y=getImage('washed_aerial.tif',4);
imshow(uint8(y));

function img=getImage(filename,gama)
x = im2double(imread(filename));
y = ((x).^gama).*255;

img = y;
end

clc
clear 
close all 

%Fourth Assigment 

y=getImagee('fractured_spine.tif',0.3);
subplot(1,3,1)
imshow(uint8(y));
title('game 0.3');

y=getImagee('fractured_spine.tif',0.4);
subplot(1,3,2)
imshow(uint8(y));
title('game 0.4');


y=getImagee('fractured_spine.tif',0.5);
imshow(uint8(y));
title('game 0.5');

function img=getImagee(filename,gama)
x = im2double(imread(filename));
y = ((x).^gama).*255;

img = y;
end


clc
clear 
close all 


x = double(imread('fractal_iris.tif'));
for i=1:8
    subplot(2,4,i)
    b = bitget(x,i);
    imshow(b)
    title(i)
end



