%% As far as I'm aware this will only work on square images not rectangular ones

X_int = imread('square.jpg'); % Read in the image
X_double = double(X_int); % Convert to a double
A = flip(eye(1024)); % This creates a flipped identity matrix of size 1024x1024 which is the size of the image

% | 0 0 1 | %
% | 0 1 0 | %
% | 1 0 0 | %

% This makes use of hmwk 6, we learned that left hand multiplication swaps
% rows and right hand mult. swaps columns. If we use both at the same time
% we can rotate an image 180 degrees as seen in this example

X_flip(:,:,1) = A*X_double(:,:,1)*A;
X_flip(:,:,2) = A*X_double(:,:,2)*A;
X_flip(:,:,3) = A*X_double(:,:,3)*A;

imagesc(uint8(X_flip))
