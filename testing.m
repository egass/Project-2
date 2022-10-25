X_int = imread('square.jpg');
X_double = double(X_int);
A = flip(eye(1024));

X_flip = A*X_double(:,:,1)*A + A*X_double(:,:,2)*A + A*X_double(:,:,3)*A;

imagesc(uint8(X_flip))
