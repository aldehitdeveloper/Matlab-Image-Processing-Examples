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