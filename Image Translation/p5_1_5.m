A = imread('rectangle.jpg'); %% Read the image
X_double = double(A); %% Convert to double
[m, n, c] = size(A); %% Get the size data from the image
r = 306; %% # of pixels to shift
E = eye(n); %% Identity
T = zeros(n);

T(:,1:r) = E(:,n-(r-1):n); %% For columns 1 to r replace them with the identity columns from the (n - r - 1)th column to the last column
T(:,r+1:n) = E(:,1:n-r); %% From column r + 1 to the last column replace it with the identity from 1 to n - r

% writematrix(T,'matrix.txt') %% Write the matrix to a txt file
% figure();
% hold on
% spy(T) %% Plot the matrix on a graph with a vertical line at 306
% xline(306,'LineWidth',2,'Color','red')
% hold off

X_double(:,:,1) = X_double(:,:,1) * T; %% Modify the image matrix to have the shifted pixels
X_double(:,:,2) = X_double(:,:,2) * T;
X_double(:,:,3) = X_double(:,:,3) * T;


 imagesc(uint8(X_double)) %% Print the image

imwrite(uint8(X_double),'shiftedRectangle5_1_5.jpg')

