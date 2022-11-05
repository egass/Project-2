A = imread('rectangle.jpg'); %% Read the image
X_double = double(A); %% Convert to double
[m, n, c] = size(A); %% Get the size data from the image
E = eye(n); % Identity the size of the columns of A
B = eye(m); % Identity the size of the rows of A

l = 100;
r = 100;
t = 100;
b = 100;
for i = 1:l
    E(i,i) = 0;
end
for j = n-r:n
    E(j,j) = 0;
end
for k = 1:t
    B(k,k) = 0;
end
for h = m-b:m
    B(h,h) = 0;
end

X_double(:,:,1) = B * X_double(:,:,1) * E; % Modify the image matrix to have the shifted pixels
X_double(:,:,2) = B * X_double(:,:,2) * E;
X_double(:,:,3) = B * X_double(:,:,3) * E;

figure();
imagesc(uint8(X_double)) % Print the image

