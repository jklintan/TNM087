function GImage = GammaCorrection(OImage, Gamma, Lower, Upper)
%function GImage = GammaCorrection( OImage, Gamma, Lower, Upper )

%   Implement gamma correction:
%   Truncate the original gray values using lower and upper quantiles
%   (Lower, Upper) and then apply gamma correction with exponent Gamma
%   to the input image OImage,
%   the result is the double image GImage with maximum gray value one
%
%% Who has done it
%
% Authors: Josefine Klintberg (joskl841)
%
%% Syntax of the function
%
%   Input arguments:
%       OImage: Grayscale image of type uint8 or double
%       Gamma: exponent used in the gamma correction,
%       Lower: value in the range 0, 1
%       Upper: value in the range 0, 1 and lower < upper
%       Lower and Upper are quantile values.
%   Output argument: GImage: gamma corrected gray value image of type double
%
% You MUST NEVER change the first line
%
%% Basic version control
%
% Version: 1
% Date: 2018-11-21
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
% 4) In case a task requires that you have to submit more than one function
%       save every function in a single file and collect all of them in a
%       zip-archive and upload that to Lisam. NO RAR, NO GZ, ONLY ZIP!
%
% 5) Often you must do something else between the given commands in the
%       template
%
%% Image class handling

OImage = im2double(OImage); %If the input image is of class double, then the output image is identical

%% Compute lower and upper gray value boundaries.
% Use the parameteers Lower and Upper to find the corresponding gray values
% for the boundaries

lowgv = quantile( OImage(:) , Lower); % Lower-bound gray value,
uppgv = quantile( OImage(:), Upper); % Upper-bound gray value

%% Compute a scaled version GImage of the image, where:
% the lower-bound gray value is zero
% the upper-bound gray value is one
% because 0^Gamma = 0 and 1^Gamma = 1

GImage = (OImage - lowgv)/(uppgv - lowgv); %Scaled version
GImage = min(GImage, 1);    %Setting values above 1 to 1
GImage = max(GImage, 0);    %Setting values below 0 to 0

%Testing with different functions, creates the same output
%GImage = imadjust(OImage,[lowgv uppgv]);
%maps intensity values in OImage to new values in GImage such
%that values between lowgv and uppgv map to values between 0 and 1.

%% Gamma mapping of the previous result
% Make sure that your image is in the range [0,1] before applying gamma
% correction!

GImage = GImage.^Gamma;  % apply gamma correction by elementwise divide by gamma


end

%%




%% Experiments with your code
%
% Use your code to modify the images 'aerialview-washedout.tif' and
% 'spillway-dark.tif' for different values for Gamma, Lower and Upper
% Write some comments on your experiments and propose some good parameters
% to use (don't forget to comment your text so that the code will work)
%
% 'spillway-dark.tif':
% When looking at the image Spillway-dark we can see that the main problem
% with the image is that it is too dark.
%
% When displaying the histogram of the image it can be seen that most of the
% intensityvalues are in the lower range of (darker). We want to focus on
% the lower intensities when choosing values for lower and upper.
%
% A gamma value below 1 will brighten the image and by exerimenting with
% lower and upper boundaries we can find that gamma = 0.8 and using
% lower = 0 and upper = 0.8 gives a pretty good result. It can also be
% applied for the whole picture.
%
% Using a lower value for gamma gives a washed-out feeling over the
% picture.
%
% If it is desired to get more contrast in the image, there is also an
% option of using a value for gamma above 1 (like 1.2) and apply to the
% whole picture. The result will be another type of B&W-image but we will
% lose some details in the shadows.
%
%
% 'aerialview-washedout.tif'
% For the aerial washedout picture we have a really low contrast image that
% we want to enhance. It would be nice to get a bit more contrast and make
% it a bit darker. A value bigger than 1 should be what we want.
%
% Applied to the whole image it gives a good contrast for a gamma around 3.5.
% If we try to narrow the quantiles we will get either burnt out white
% pixels or too dark black pixels.
%
%
% The image 'IntensityRampGamma25.tif' illustrates the effect of an intensity
% ramp displayed on a monitor with gamma =2.5.
% Which value for gamma should you use in your code to correct the image to appear as a linear intensity ramp?
% (Set Lower=0 and Upper=1)
% Gamma = 0.4
% This is because if we want to compensate for the gamma on
% the screen, we need to apply a gamma transformation of 1/2.5 = 0.4
%
%



