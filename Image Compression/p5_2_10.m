I = eye(5);
disp(sReturn(I)*sReturn(I))
I2 = eye(5);
disp(sReturn(I2))
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