A = [0 0 0 0 1; 1 0 0 0 0; 0 1 0 0 0; 0 0 1 0 0; 0 0 0 1 0];
x = [1;2;3;4;5];

disp('~~ Identity shifted down 1 ~~')
disp(A)
disp('~~ Standard column vector ~~')
disp(x)

disp('~~ Shifted column vector ~~')
b = A*x;
disp(b)