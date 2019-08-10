x = (imread('circuit.tif')); %read image for double 
x=double(x);%convert orginal image double for calculations
subplot(2,3,1)
imshow(uint8(x))
title('orginal image')

%average filter 
filter = ones(15,15)/15^2;
c = conv2(x,filter,'same');
subplot(2,3,2)
imshow(uint8(c))
title('conv 15x15')

%image fourier transform 
fImage = fft2(x);
fImageShow = fftshift(fImage);%calculate fourier 
fImageShow= log(1+fImageShow);%for easy to show log transform
subplot(2,3,3)
imshow(abs(fImageShow),[])
title('Orginal Image fourier transform')

%filter fourier transform 
row = length(x(:,1));%image row size
colum= length(x(1,:));%image colum size
fFilter = fft2(filter,row,colum);%calculate filter fourier but increase size because we multiply with image and it must same size 
fFilterShow= fftshift(fFilter);%to show easy use fftshift for only show image 
fFilterShow= log(1+fFilterShow);%to show easy use log transform 
subplot(2,3,4)
imshow(abs(fFilterShow),[])
title('Filter fourier transform')

FiltredImage= fImage.*fFilter; %time domain convolution, frequncy domain multiplication 
subplot(2,3,5);
imshow(abs(fftshift(log(1+FiltredImage))),[]) 
title('Frequncy domain filtred image')

final = ifft2(ifftshift(FiltredImage));%inverse of frequncy domain it is time domain 
subplot(2,3,6);
imshow(abs(final),[])
title('Filtering with Fourier Model')


% These two images are very simalar These two imagese are blured and teorically we know on spatial domain filtered image these output should be same and as we see outputs are same however there is a black border because there is a not pad
