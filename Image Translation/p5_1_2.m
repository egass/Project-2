X = imread('grayscaleRectange5_1_1.jpg'); %% Reading the grayscale image
X_double = double(X); %% convert to double

X_2intensity(:,:,1) = X_double(:,:,1)*2; %% changing the RBG channels to have double intensity
X_2intensity(:,:,2) = X_double(:,:,2)*2;
X_2intensity(:,:,3) = X_double(:,:,3)*2;


figure(); %% Creating a figure
hold on
subplot(1,2,1); %% Left Subplot
imagesc(uint8(X_double))
title('Original Image')

subplot(1,2,2); %% Right Subplot
title('2x Image Intensity')
imagesc(uint8(X_2intensity))
title('2x Image Intensity')
hold off

imwrite(uint8(X_2intensity),"increasedIntensity5_1_2.jpg")

