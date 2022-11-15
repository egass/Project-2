img = imread('square.jpg');
double_img = double(img);
imgRed= double_img(:,:,1); 
imgGreen = double_img(:,:,2);
imgBlue = double_img(:,:,3);

%Compressing the red channel
imRedComp = sReturn(imgRed)*imgRed*sReturn(imgRed);
newRedFrequencies = filter(imRedComp);
finalRed = sReturn(newRedFrequencies)*newRedFrequencies*sReturn(newRedFrequencies);

%compressing the green channel
imGreenComp = sReturn(imgGreen)*imgGreen*sReturn(imgGreen);
newGreenFrequencies = filter(imGreenComp);
finalGreen = sReturn(newGreenFrequencies)*newGreenFrequencies*sReturn(newGreenFrequencies);

%compressing the blue channel
imBlueComp = sReturn(imgBlue)*imgBlue*sReturn(imgBlue);
newBlueFrequencies = filter(imBlueComp);
finalBlue = sReturn(newBlueFrequencies)*newBlueFrequencies*sReturn(newBlueFrequencies);

finalImg(:,:,1) = finalRed;
finalImg(:,:,2) = finalGreen;
finalImg(:,:,3) = finalBlue;

figure();
hold on
subplot(1,2,1);
imagesc(uint8(double_img));
title('Original Image');

subplot(1,2,2);
imagesc(uint8(finalImg));
title('Compressed image');
hold off

function [compressed_frequency] = filter(img)
p = .001;
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