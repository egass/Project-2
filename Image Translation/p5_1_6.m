A = imread('rectangle.jpg'); %% Read the image
X_double = double(A); %% Convert to double
[m, n, c] = size(A); %% Get the size data from the image
r = 306; % # of pixels to shift horizontally 
v = 230; % # of pixels to shift vertically
E = eye(n); % Identity the size of the columns of A
B = eye(m); % Identity the size of the rows of A
T = zeros(n); 
S = zeros(m);

T(:,1:r) = E(:,n-(r-1):n); % For columns 1 to r replace them with the identity columns from the (n - r - 1)th column to the last column
T(:,r+1:n) = E(:,1:n-r); % From column r + 1 to the last column replace it with the identity from 1 to n - r

S(:,1:v) = B(:,m-(v-1):m); % For columns 1 to v replace them with the identity columns from the (m - v - 1)th column to the last column
S(:,v+1:m) = B(:,1:m-v); % From column v + 1 to the last column replace it with the identity from 1 to m - v


X_double(:,:,1) = S * X_double(:,:,1) * T; % Modify the image matrix to have the shifted pixels
X_double(:,:,2) = S * X_double(:,:,2) * T;
X_double(:,:,3) = S * X_double(:,:,3) * T;


imagesc(uint8(X_double)) % Print the image

imwrite(uint8(X_double),'HorzAndVert5_1_6.jpg')

