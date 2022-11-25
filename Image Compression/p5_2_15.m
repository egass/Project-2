clear; close all;
%Reading the image Square.jpg into the appropriate channels (RBG)
img = imread('square.jpg');
double_img = double(img);
imgRed= double_img(:,:,1); 
imgGreen = double_img(:,:,2);
imgBlue = double_img(:,:,3);

%set the variable compressedSize, which will be the number of nonzero
%entries of each channel of the compressed image summed together.
compressedSize = 0;
%I use a slightly modified version of the sReturn function to get the DST
%of each channel in the image
imRedComp = sReturn(imgRed)*imgRed*sReturn(imgRed);
imGreenComp = sReturn(imgGreen)*imgGreen*sReturn(imgGreen);
imBlueComp = sReturn(imgBlue)*imgBlue*sReturn(imgBlue);
%find the number of non zero entries in the DST of each channel and add
%them together. This will give the size of the image without any
%compression or filters applied.
originalSize = nnz(imRedComp) + nnz(imGreenComp) + nnz(imBlueComp);
%create list of p values- .1, .3, and .5 
pvals = .1:.2:.5;

for i = 1:3
    %filtering each channel with the ith element of the pvals matrix
    newRedFrequencies = filter(imRedComp, pvals(i));
    newGreenFrequencies = filter(imGreenComp, pvals(i));
    newBlueFrequencies = filter(imBlueComp, pvals(i));
    %using nnz to find the number of non zero entries of the channels and
    %then adding them together 
    compressedSize = nnz(newRedFrequencies) + nnz(newGreenFrequencies) + nnz(newBlueFrequencies);
    cr = originalSize/compressedSize;
    %displays the correct values for p and the compression ratio 
    fprintf('Compression ratio for p = %f: %f\n', pvals(i), cr);
    compressedSize = 0;
    
end

%slightly modified filter function where p is taken as an input argument
%and not set in the function
function [compressed_frequency] = filter(img, p)
n = size(img,1);
compressed_frequency = zeros(1, n);
for i = 1:n
    for j = 1:n
        if((i+j)>p*2*n)
            compressed_frequency(i, j) = 0;
        else
            compressed_frequency(i, j) = img(i, j);
        end
    end
end
end



function [s] = sReturn(matr)
%since in this project the matrices are guaranteed to be square (nxn), I
%can get the size of just one dimension.
n = size(matr, 1);
%I preallocate the memory here to have an nxn matrix because this is faster
%than reallocating the memory each time I add an element to the array
s = zeros(1, n);
mult = sqrt(2/n);
for i = 1:n
    for j = 1:n
        s(i,j) = mult*sin((pi/n)*(i-.5)*(j-.5));
    end
end

end