
a = [1 2 3; 4 5 6; 7 8 9];
disp(sReturn(a))
function [s] = sReturn(matr)
%since in this project the matrices are guaranteed to be square (nxn), I
%can get the size of one dimension.
n = size(matr, 1);
%I preallocate the memory here to have an nxn matrix because this is faster
%than reallocating the memory with each time the loop goes through
s = zeros(1, n);
mult = sqrt(2/n);
for i = 1:n
    for j = 1:n
        s(i,j) = mult*sin((pi/n)*(i-.5)*(j-.5));
    end
end

end
% function [t, y, fval] = eulerSolve(fiveYrfunction, moreYrfunction, tspan, y0, h, p)
% %this gets the inital value of t and the final value of t, which will be 0
% %and 40
% t0 = tspan(1);
% tf = tspan(2);
% %makes a vector from 0 to 40 with an increment of .01 between each element
% t = t0:h:tf;
% y = zeros(1, length(t));
% %sets y(1) = 750000
% y(1) = y0;
% %applies Euler's method recursively.
% %for the first 5 years (or n = 500, because 500*.01 which is the step size
% %is equal to 5), I use the derivative defined for the first 5 years
% %for all values of n after 500, I use Euler's method with the change in
% %money owed being equal to (((r + (.015*(sqrt(t-5))))*y) -(p*12))
% for n = 1:(length(y)-1)
%    if n <= 500
%       y(n+1) = y(n) + fiveYrfunction(.03, y(n), p)*h;
%     else
%         y(n+1) = y(n) + moreYrfunction(.03, y(n), p, (n-1)*h)*h;
%     end
% end
% %basically I declare tneg as an array and it stores all the values of t
% %when y < 0
% tneg = t(y<0);
% %fval is the first value of the tneg array or the first value of t in which y <
% %0
% fval = tneg(1);
% end