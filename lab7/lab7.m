%% Question 1
rgbImage = imread('lenna_RGB.tif');
rChannel = rgbImage(:,:,1); % Red channel
gChannel = rgbImage(:,:,2); % Green channel
bChannel = rgbImage(:,:,3); % Blue channel

figure 
subplot(1,3,1)
imshow(rChannel)
title('Red Channel')
subplot(1,3,2)
imshow(gChannel)
title('Green Channel')
subplot(1,3,3)
imshow(bChannel)
title('Blue Channel')

%% Question 2
hsvimg =rgb2hsv(rgbImage);
hChannel =hsvimg(:,:,1);%hue is a angle and this is detect color value (red or something else)
sChannel =hsvimg(:,:,2);%saturation is give a color power
vChannel =hsvimg(:,:,3);%value is 0 black 1 is give a color however if value is 1 and sat is 0 this give white 
figure 
subplot(1,3,1)
imshow(hChannel)
title('H Channel')
subplot(1,3,2)
imshow(sChannel)
title('S Channel')
subplot(1,3,3)
imshow(vChannel)
title('V Channel')

%% Question 3
YCBCR = rgb2ycbcr(rgbImage);

y =YCBCR(:,:,1);%hue is a angle and this is detect color value (red or something else)
cb=YCBCR(:,:,2);%saturation is give a color power
cr=YCBCR(:,:,3);%value is 0 black 1 is give a color however if value is 1 and sat is 0 this give white 
figure 
subplot(1,3,1)
imshow(y)
title('H Channel')
subplot(1,3,2)
imshow(cb)
title('S Channel')
subplot(1,3,3)
imshow(cr)
title('V Channel')

%% Question 4 

%Orjinal Photo
figure
subplot(4,2,1)
imshow(rgbImage)
title('Orginal Image')
subplot(4,2,2)
histogram(rgbImage)

%RGB Histogram
rEq = histeq(rChannel);
gEq = histeq(gChannel);
bEq = histeq(bChannel);
nrgbImage = cat(3, rEq,gEq,bEq);
subplot(4,2,3)
imshow(nrgbImage)
title('RGB - Histogram Equalizated')
subplot(4,2,4)
histogram(nrgbImage)


%HSV Histogram
vEq = histeq(vChannel);
nhsvImage = cat(3, hChannel,sChannel,vEq);
nhsv2rgb= hsv2rgb(nhsvImage);
subplot(4,2,5)
imshow(nhsv2rgb)
title('HSV - Histogram Equalizated')
subplot(4,2,6)
histogram(nhsv2rgb)


%YCbCr Histogram

yEq = histeq(y);
nycbcrImage = cat(3,yEq,cb,cr);
nycbcr2rgb= ycbcr2rgb(nycbcrImage);
subplot(4,2,7)
imshow(nycbcr2rgb)
title('Ycbcr - Histogram Equalizated')
subplot(4,2,8)
histogram(nycbcr2rgb)

%After the histogram there are 3 different result.Firt result is RGB.In rgb
%histogram we expand all all colors 0 to 255.In orginal photo main color is
%red but after the histogram there is no main color because color ratio
%equalized.
%Secont is HSV and we histogram only v parameters.V parameter show that
%color light power.If v=1 it shows that lightest color.I think after the
%histogram equalize light value.Maybe histograms not true because in this
%variables have 3 parameters and maybe we can not see every channel in the 
%historam.
%Thirdly Y is values again change colors black and white.So that it is
%optimum parameter for histogram but we are not sure is this true histogram
%technic.


%% Question 5 
imgOrgLinc = imread('lincoln.tif');
strDisk=strel('square',3);%Structuring element
imgDialted=imdilate(imgOrgLinc,strDisk);%Dialte the image by structuring element
figure,imshow(imgDialted-imgOrgLinc);
title('Boundry image');

%Firstly create a structure.This structure 3x3 we use imdilate and expand
%image after this image size little bit increase after this step if delete
%the orginal image you see only boundry easly.

%% Question 6 
imgOrgText = imread('text_gaps.tif');
strDisk=strel('square',3);%Structuring element
imgDialted=imdilate(imgOrgText,strDisk);
imgDialted=imerode(imgDialted,strDisk);


figure,subplot(1,2,1),imshow(imgDialted1),title('Orginal Image');
subplot(1,2,2),imshow(imgDialted),title('Final Image');

%In this algorithm firstly we expand the image with imdilate we lost
%deformation but characters thin is increase so that there is not easly reading 
%Secondly we should narrow the characters so that we use imerode and show
%the image 