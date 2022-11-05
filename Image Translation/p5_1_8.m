A = imread('rectangle.jpg');
B = permute(A, [2 1 3]); %% switch rows and coloums
imagesc(B);
imwrite(B,'transposedRectangle.jpg')
