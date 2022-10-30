A = [1 1 1 1 1; 2 2 2 2 2; 3 3 3 3 3];
[m, n, c] = size(A); %% Get the size data from the image
r = 2; %% # of pixels to shift
E = eye(m); %% Identity
T = zeros(m);

T(:,1:r) = E(:,m-(r-1):m); %% For columns 1 to r replace them with the identity columns from the (n - r - 1)th column to the last column
T(:,r+1:m) = E(:,1:m-r); %% From column r + 1 to the last column replace it with the identity from 1 to n - r

disp(T)

disp(T*A)


