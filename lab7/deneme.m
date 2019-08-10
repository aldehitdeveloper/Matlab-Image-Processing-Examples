%READ THE INPUT IMAGE
%I = imread('lenna_RGB.tif');
I = imread('2.PNG');

%CONVERT THE RGB IMAGE INTO HSV IMAGE FORMAT
HSV = rgb2hsv(I);
%http://angeljohnsy.blogspot.com/2013/05/converting-rgb-image-to-hsi.html


%PERFORM HISTOGRAM EQUALIZATION ON INTENSITY COMPONENT
Heq = histeq(HSV(:,:,3));
%http://angeljohnsy.blogspot.com/2011/04/matlab-code-histogram-equalization.html

HSV_mod = HSV;
HSV_mod(:,:,3) = Heq;
figure 
histogram(Heq)
figure
histogram(HSV_mod)

RGB = hsv2rgb(HSV_mod);
%http://angeljohnsy.blogspot.com/2013/06/convert-hsi-image-to-rgb-image.html

figure,subplot(2,2,1),imshow(I);title('Before Histogram Equalization');
subplot(2,2,2)
histogram(I);
       subplot(2,2,3),imshow(RGB);title('After Histogram Equalization');
       subplot(2,2,4) ,histogram(RGB);