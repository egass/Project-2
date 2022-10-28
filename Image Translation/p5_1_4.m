A = [1 2 3 4; 5 6 7 8; 9 10 11 12; 13 14 15 16]; %% Sample Matrix
E = eye(4); %% Identity 4x4

E(:,[1 4]) = E(:,[4 1]); %% Swap columns 1 & 4 with each other, this logic also applies to swapping rows

AE = A*E; %% We left multiply E on the right hand side of A which swaps A's columns, we left hand multiplication would swap rows
disp(AE) %% Display A*E's product