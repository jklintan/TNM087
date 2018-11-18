
%TASK1
% 
% BookCover = imread('book-cover.tif'); %Read in image
% BCd = im2double(BookCover);
% 
% BookCover2 = BCd/16;
% BookCover3 = BookCover2*16;

% 
% %Values for original read in and normalized image
% MaxValue = max(BookCover(:))
% MinValue = min(BookCover(:))
% GraylevelsIm1 = MaxValue - MinValue;
% 
% MaxValue2 = max(BookCover2(:))
% MinValue2 = min(BookCover2(:))
% GraylevelsIm2 = MaxValue2 - MinValue2;
% 
% MaxValue3 = max(BookCover3(:))
% MinValue3 = min(BookCover3(:))
% GraylevelsIm3 = MaxValue3 - MinValue3;
% 
% imshow(BookCover, [])
% figure
% imshow(BookCover2, [])
% figure
% imshow(BookCover3)

%TASK2
% Einstein = imread('einstein-low-contrast.tif');
% 
% E = im2double(Einstein);
% EMaxValue = max(E(:));
% EMinValue = min(E(:));
% 
% %imshow(E);
% %imhist(E);
% 
% %Contrast stretching
% Econt = (E-EMinValue)/(EMaxValue-EMinValue);
% imshow(Econt)
% imhist(Econt)
% EcontMaxValue = max(Econt(:))
% EcontMinValue = min(Econt(:))


%TASK 3
% Im1 = imread('angiography-mask-image.tif');
% Im2 = imread('angiography-live-image.tif');
% 
% I1 = im2double(Im1);
% I2 = im2double(Im2);
% 
% Imdiff = I1 - I2;
% imshow(Imdiff, []);

%TASK4

% Pollen = imread('pollen-lowcontrast.tif');
% P = im2double(Pollen);
% 
% Ph = histeq(P);
% imshow(Ph)
% figure;
% imhist(Ph)

%TASK5

