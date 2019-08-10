% Introduction to MATLAB-based image processing

% understand image intensity field
x1 = imread('edge64.pgm');
x2 = im2double(imread('edge64.pgm'));
x3 = double(imread('edge64.pgm'));
whos

% visualize image as a 3-D surface
surf(double(x1))

% downsampling introduces aliasing
x = imread('barb_org.pgm');
y = x(1:2:end,1:2:end);
subplot(1,2,1); imshow(x);
subplot(1,2,2); imshow(y);

% play with a color image
x = imread('fl_orig.ppm');
r = x(:,:,1);
g = x(:,:,2);
b = x(:,:,3);
imshow([r g b]);

% halftoning experiment
x = double(imread('lena.png'));
y = Floyd_Steinberg(x,2);
imwrite(y,'lena.pbm');
imshow(y,[]);

% a simple image perception experiment
x1 = 50*ones(200);
x2 = x1*4;
x1(51:150,51:150) = 100;
x2(51:150,51:150) = 100;
imshow([x1 x2],[]);

% write out an image as JPEG file
x = imread('cameraman.tif');
imwrite(x,'cameraman.jpg','quality',50);
x_dec = imread('cameraman.jpg');
mse = mean2((x-x_dec).^2);
psnr = 10*log10(255*255/mse);
d = dir('cameraman.jpg');
rate = d.bytes*8/prod(size(x));

% Excerise: histogram calculation
% how to caculate the histogram of an image as fast as you can?

% Excercise: Einstein-Monroe optical illusion
x = imread('marilyneinstein.jpg');
% Is this a picture of Albert Einstein? Yes. But wait - look at it far away
% Do you see Marillyne Monroe now? That is strange!!!
imshow(x);
% can you separate the image of Einstein from that of Monroe?







