A = imread('rectangle.jpg');
%{
The image matrix here is m x n x c, what permute does is this:
...[2 1 3] says to swap m & n but leave c where it already is.
%}

B = permute(A, [2 1 3]); %
imagesc(uint8(B));
%%imwrite(B,'transposedRectangle.jpg')
