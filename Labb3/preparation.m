% cTP = imread('characterTestPattern.tif');
% cTP = im2double(cTP);
% %imshow(cTP);
% 
% F = fftshift(fft2(cTP));
% A = log(1 + abs(F));
% A = A/max(A(:));
% %imshow(A);
% imwrite(A, 'Spec1.png')
% 
% cTP_shift = circshift(cTP, [100, -200]);
% 
% F2 = fftshift(fft2(cTP_shift));
% A2 = log(1 + abs(F2));
% A2 = A2/max(A2(:));
% %imshow(A2)
% imwrite(A2, 'Spec2.png')
% 
% 
% cTP_rot = imrotate(cTP, 15, 'bicubic');
% imshow(cTP_rot)
% F3 = fftshift(fft2(cTP_rot));
% A3 = log(1 + abs(F3));
% A3 = A3/max(A3(:));
% imshow(A3)
% imwrite(A3, 'Spec3.png')

%%

% cTP2 = imread('characterTestPattern_my.tif');
% cTP2 = im2double(cTP2);
% 
% %imshow(cTP2)
% 
% F = fftshift(fft2(cTP2));
% A = log(1 + abs(F));
% A = A/max(A(:));
% imshow(A)
% imwrite(A, 'Specmy.png')

%%

% cTP3 = imread('characterTestPattern_3.tif');
% cTP3 = im2double(cTP3);
% 
% %imshow(cTP2)
% 
% F = fftshift(fft2(cTP3));
% A = log(1 + abs(F));
% A = A/max(A(:));
% imshow(A)
% imwrite(A, 'Spec5.png')


%% Period and Frequency
% 
% v2 = imread('test.tif');
% 
% F = fftshift(fft2(v2));
% A = log(1 + abs(F));
% A = A/max(A(:));
% imshow(A)
% imwrite(A, 'Spec8.png')

% %% Importance of spectrum and phase angle
% 
% E1 = imread('Einstein1.jpg');
% E1 = im2double(E1);
% 
% E2 = imread('Einstein2.jpg');
% E2 = im2double(E2);
% 
% %Fourier spectrum of images
% F1 = fftshift(fft2(E1));
% F2 = fftshift(fft2(E2));
% 
% ang1 = angle(F1);
% ang2 = angle(F2);
% S1 = abs(F1);
% S2 = abs(F2);
% 
% Prob14 = real(ifft2(S1.*exp(i * ang2)));
% imshow(Prob14)
% imwrite(Prob14, 'E1_E2.png')
% 
% Prob15 = real(ifft2(S2.*exp(i * ang1)));
% imshow(Prob15)
% imwrite(Prob15, 'E2_E1.png')
