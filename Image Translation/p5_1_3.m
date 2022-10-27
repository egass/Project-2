X = imread('rectangle.jpg'); %% Read in the file
[rows, columns, channels] = size(X); %% This call returns the image dimensions as a row vector 
X_double = double(X); %% Convert values to doubles
eighty = 80*ones(rows,columns); %% Matrix where every value is 80

X_modified(:,:,1) = X_double(:,:,1) .* 0; %% Multiplying the red channel values by 0
X_modified(:,:,3) = X_double(:,:,3) + eighty; %% Adding 80 to every value in the matrix

imagesc(uint8(X_modified)) %% Printing the image
imwrite(uint8(X_modified),"NoRed80Blue5_1_3.jpg") %% Writing the image to a file