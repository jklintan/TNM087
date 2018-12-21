function out=RemoveSinusoidalNoise(in,D0)
%% Lab3, Task 3
%% Removes the most dominant sinusoidal noise
%
% Removes the most dominant sinusoidal noise by applying a Butterworth
% Notch Reject filter in the frequency domain
%
%% Who has done it
%
% Author: Josefine Klintberg (joskl841)
%
%% Syntax of the function
%      Input arguments:
%           in: the original input grayscale image (which is corrupted by
%           sinusoidal noises) of type double scaled between 0 and 1.
%           D0: The bandreject width of the Notch filter being constructed
%
%      Output argument:
%           out: the output image where the most dominant sinusoidal noise
%           is eliminated from the input image
%
% You MUST NEVER change the first line
%
%% Basic version control (in case you need more than one attempt)
%
% Version: 1
% Date: 2018-12-05
%
%
%% General rules
%
% 1) Don't change the structure of the template by removing %% lines
%
% 2) Document what you are doing using comments
%
% 3) Before submitting make the code readable by using automatic indentation
%       ctrl-a / ctrl-i
%
% 4) Your code should work for any given input arguments, if they are
%    fulfilling the conditions specified in the syntax of the function
%
% 5) In case a task requires that you have to submit more than one function
%       save every function in a single file and collect all of them in a
%       zip-archive and upload that to Lisam. NO RAR, NO GZ, ONLY ZIP!
%
% 6) Often you must do something else between the given commands in the
%       template
%
%% Here starts your code.
% Write the appropriate MATLAB commands right after each comment below.
%
%% Localize the most dominant sinusoidal noise
% The peaks of sinusoidal noises come in pair. You are supposed to find
% the most dominant pair. Actually, it is enough if you locate one of these two.
% In the Notch filter, however, you will create notches at both of them.
% Read the pdf document related to this task for help.

F= fftshift(fft2(in)); % the Fourier spectrum (i.e. the magnitude of the Fourier transform)
% of the image followed by fftshift

[M, N] = size(F);

F2= abs(F); % make a copy of F and set the pixel values at the center and a
C_row = floor(M/2)+1;
C_col = floor(N/2)+1; %Center values
F2([C_row-2:C_row+2], [C_col-2:C_col+2]) = 0;    % neighborhood around it to a small number (for example 0)

[U,I] = max(F2(:));
[I_row, I_col] = ind2sub(size(F2),I);
r= I_row; % the row number of one the two dominant peaks
c= I_col; % the column number of the same peak as above

%% Construct Notch filter
% If you want, you can write a separate function to construct the Notch filter.
% If you do so, don't forget to submit that MATLAB function as well.
%
%% Find uk and vk to construct the Butterworth bandreject filter
% Use the position of one of the peaks to find uk and vk, which indicate the
% position of the found maximum relative the center of the spectrum.
%
% In the lecture notes for Chapter 5, you can find more explanation on what uk
% and vk are
%



uk= I_row - C_row;  % uk and vk are the positions of the peaks relative the center of the spectrum
vk= I_col - C_col;


%% Construct the Butterworth Bandreject Notch filter
% If you want, you can write a separate function to construct the Notch filter.
% If you do so, don't forget to submit that MATLAB function as well.
%
% You have already created Gaussian filter transfer functions in Task2 of this lab.
% It is done similarly. In the lecture notes for Chapter 5, you can find
% good examples on how to create such a filter transfer function

n=2; % as specified in the task, the order should be 2

[X, Y] = meshgrid(0:M-1, 0:N-1);
X = X'; Y = Y';
Dk = sqrt((X - floor(M/2) - uk).^2 + (Y - floor(N/2) - vk).^2);
D_k = sqrt((X - floor(M/2) + uk).^2 + (Y - floor(N/2) + vk).^2);
%Flooring the M/2 and N/2 in case of odd values

H= (1./(1+(D0./Dk).^n)).*(1./(1+(D0./D_k).^n)); % The filter transfer function of the Notch bandreject filter

%% Create the output image
% Apply the Notch filter on the input image in the frequency domain, and go
% back to the spatial domain to obtain the output image

apply = F.*H;

out= real(ifft2(ifftshift(apply))); % the final output image, where the most dominant sinusoidal noise is eliminated

imshow(in)
figure
imshow(out)
%% Test your code
% Test your code using at least five different test images as specified in
% the pdf document for this task
%% Answer this question:
% For image Einstein_sinus_1, What is the smallest D0 that removes the noise almost completely?

% D0 = 12 is the smallest value where it is not possible to distinguish any
% noise even when zooming in closely

% (Using D0 = 10, we can barely see but still when zooming in, it is some
% lines in the background of the image both for D0 = 10 and 11)
