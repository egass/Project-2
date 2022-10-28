A = [1 2 3 4 5; 1 2 3 4 5; 1 2 3 4 5];
[m, n, c] = size(A); %% Get the size data from the image
r = 2; %% # of pixels to shift
E = eye(n); %% Identity
T = zeros(n);

T(:,1:r) = E(:,n-(r-1):n); %% For columns 1 to r replace them with the identity columns from the (n - r - 1)th column to the last column
T(:,r+1:n) = E(:,1:n-r); %% From column r + 1 to the last column replace it with the identity from 1 to n - r

disp(T)
disp(A*T)