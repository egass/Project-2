X = imread('rectangle.jpg'); %% read in image
X_double = double(X); %% convert image to double form
X_gray= X_double(:,:,1)/3.0 + X_double(:,:,2)/3.0 + X_double(:,:,3)/3.0; %% following 3 lines convert image to gray scale
imagesc(uint8(X_gray))
colormap('gray')
imwrite(X_gray, 'grayscaleRectange5_1_1.jpg') %% write new picture to directory
