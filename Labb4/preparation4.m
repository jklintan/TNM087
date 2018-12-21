% % Part 1
% 
% Image1a = imread('Image1a.tif');
% Image1b = imread('Image1b.tif');
% 
% %Hough transformation
% %[H, teta, ro] = hough(Image1a, 'Rhoresolution', 5, 'Theta', -90:0.5:89.5);
% [H, teta, ro] = hough(Image1b, 'Rhoresolution', 5, 'Theta', -90:0.5:89.5);
% 
% %Contrast stretching
% MaxValue = max(H(:));
% MinValue = min(H(:));
% 
% H1 = (H - MinValue)/(MaxValue - MinValue);
% 
% imshow(H1)
% imwrite(H1, 'H1.png')
% 
% [r, t] = find(H == max(H(:)));
% angle = teta(t)
% 
% % Image1a = imrotate(Image1a, -115, 'bicubic', 'crop');
% % imshow(Image1a);
% % imwrite(Image1a, 'Image1a_rotated.png')
% 
% Image1b = imrotate(Image1b, 105, 'bicubic', 'crop');
% imshow(Image1b);
% imwrite(Image1b, 'Image1b_rotated.png');

%% Part 2 Morphology

Image1c = imread('Image1c.tif');
IM = imread('Image1c_nonoise.png');

%disp(SE.Neighborhood);
SE =strel('disk',3);
IM2 = imopen(IM, SE);
IM3 = imclose(IM2, SE);

SE2 = strel('line', 10, 0);
IM4 = imopen(IM3, SE2);
IM5 = imclose(IM4, SE2);
imshow(IM5);
imwrite(IM5, 'Image1c_clean.png');

SE3 = strel('disk', 11);
IM6 = imopen(IM5, SE3);
%IM7 = imclose(IM6, SE3);
%figure; imshow(IM6);
imwrite(IM6, 'Image1c_disks.png');

SE5 = strel('disk', 14);
IM7 = imopen(IM6, SE5);
%figure; imshow(IM7);


MN = [20 100];
SE4 = strel('rectangle', MN);
IM8 = imopen(IM5, SE4);
%IM9 = imclose(IM8, SE4);

%figure; imshow(IM8);
imwrite(IM8, 'Image1c_rectangles.png');

[r, c] = size(Image1c);
RGB = zeros(r, c, 3);
RGB(:,:,1) = IM6 - IM7 ;
RGB(:,:,2) = IM6;
RGB(:,:,3) = IM8;

figure; imshow(RGB);
imwrite(RGB, 'RGB.png');

%% Labelling

L = bwlabel(IM5);
%imshow(L, [])
L = mat2gray(L);
imwrite(L, 'label.png');

S = regionprops(L,'Perimeter','Area','EulerNumber');

for n=1:length(S)
    Perimeter(n)=S(n).Perimeter;
    Area(n)=S(n).Area;
    Euler(n)=S(n).EulerNumber;
end

LargeO=find(Area>3000)
Small0 = find(Perimeter<150)
Largest = find(Perimeter > 300 & (Euler == 1))

Perimeter(LargeO);

LargeO_Im=zeros(r,c);

for n=1:length(LargeO)
    LargeO_Im(L==LargeO(n))=1;
end

BW2 = bwareafilt(logical(mat2gray(L)), [3000 10000]);
imshow(BW2)
imwrite(BW2, 'Largeobjects.png');

%hist(Perimeter)
