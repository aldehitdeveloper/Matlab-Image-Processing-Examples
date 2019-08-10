x = im2double(imread('lowContrastPollen.jpg'));

pixel_count=size(x,1)*size(x,2);%get pixel count                

hist=zeros(1,256);%create for histogram array
x=x.*256;%orginal photo opeened double so that times 256

for i = 1:size(x,1)%go to photo matrix first dimention
    for j =1:size(x,2)%go to photo matrix first dimention
       hist(1,round(x(i,j)))= hist(1,round(x(i,j)))+1 ; %write hist go to pixel and which colour increase 1 
    end
end

hist_size = 1:1:256;%for plot i create matrix

%plot histogram
subplot(3,2,1)
plot(hist_size,hist)
title('Histogram')

pdf_version= hist./pixel_count%pdf version is only diveded each element by each 

%plot pdf
subplot(3,2,3)
plot(hist_size,pdf_version)
title('PDF')


cdf_version = zeros(1,256);%create matrix for cdf 

for i = 1:length(hist)% 
    total =0;
    for j =1:i
      total = total + pdf_version(1,j); %add before all cell 
    end
     cdf_version(1,i)= total;  %and write to cell
end


transfer_version=cdf_version*255;%cdf version is only multiply each element by each 
transfer_version=round(transfer_version);%transfer funcion should be integer numbers

%show cdf
subplot(3,2,4)
plot(hist_size,transfer_version)
title('CDF')

%for final photo matrix
final_photo = zeros(size(x,1),size(x,2));


for i = 1:size(x,1)
    for j =1:size(x,2)
       final_photo(i,j) = transfer_version(round(x(i,j)));%go pixel get colour and get for this value's transfer function and write new matrix
    end
end

%plot again
subplot(3,2,5)
imshow(uint8(x));
title('Orginal Photo')

subplot(3,2,6)
imshow(uint8(final_photo));
title('Final Photo')


