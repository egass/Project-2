A = imread('rectangle.jpg');
X_double = double(A);
[m, n, c] = size(A); 
I = eye(m);
spy(I) 

T = I(:,end:-1:1); %% loop backwards through identity matrix and make T matrix
spy(T)

X_double(:,:,1) = T * X_double(:,:,1); %% Modify the image matrix to have the shifted pixels
X_double(:,:,2) = T * X_double(:,:,2);
X_double(:,:,3) = T * X_double(:,:,3);

imagesc(uint8(X_double))
imwrite(X_double, 'flipRectangle.jpg')

            