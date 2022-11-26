clear; close all;
%read the image into a matrix img
img = imread('square.jpg');
%converts it into matrix of doubles
double_img = double(img);
%imgRed for the red channel of the image
imgRed= double_img(:,:,1); 
%imgGreen for the green channel of the image
imgGreen = double_img(:,:,2);
%imgBlue for the blue channel of the image
imgBlue = double_img(:,:,3);

%% Compressing the red channel %%
%Here I find the DST of the red channel by multiplying the rows and columns
%by the S matrix (whichs is given by the S return function)
imRedComp = sReturn(imgRed)*imgRed*sReturn(imgRed);
newRedFrequencies = filter(imRedComp);
finalRed = sReturn(newRedFrequencies)*newRedFrequencies*sReturn(newRedFrequencies);

%% Compressing the green channel %%
imGreenComp = sReturn(imgGreen)*imgGreen*sReturn(imgGreen);
%Here I apply the "filter" function which effectively sets the value in the
%Transformed matrix equal to 0 if frequency is above a certain threshold,
%which whill save space on memory
newGreenFrequencies = filter(imGreenComp);
finalGreen = sReturn(newGreenFrequencies)*newGreenFrequencies*sReturn(newGreenFrequencies);

%% Compressing the blue channel %%
imBlueComp = sReturn(imgBlue)*imgBlue*sReturn(imgBlue);
newBlueFrequencies = filter(imBlueComp);
%Here, in order to get back to the original image x, I employed the fact
%that the matrix S is its own transpose and also its own inverse.
%Therefore, if y = SxS, to get back to y, x = SyS.
finalBlue = sReturn(newBlueFrequencies)*newBlueFrequencies*sReturn(newBlueFrequencies);

%setting the channels to the appropriate compressed matrices
finalImg(:,:,1) = finalRed;
finalImg(:,:,2) = finalGreen;
finalImg(:,:,3) = finalBlue;

%plotting each image
figure();
hold on
subplot(1,2,1);
imagesc(uint8(double_img));
title('Original Image');

subplot(1,2,2);
imagesc(uint8(finalImg));
title('Compressed image');
hold off
%imwrite(uint8(finalImg),"Pvalue=.05.jpg");
function [compressed_frequency] = filter(img)
p = .1;
%creating matrix of zeros because preallocating is faster than allocating
%during runtime
n = size(img,1);
compressed_frequency = zeros(n, n);
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
s = zeros(n, n);
mult = sqrt(2/n);
for i = 1:n
    for j = 1:n
        s(i,j) = mult*sin((pi/n)*(i-.5)*(j-.5));
    end
end

end