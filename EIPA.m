 %ELEC 4700
%Tariq Aboushaer
%101064544
%PA 5

set(0, 'DefaultFigureWindowStyle', 'docked')
clc; 
close all; 
clear;


nx = 50;
ny = 50;

S = sparse(nx*ny,nx*ny);
for i = 1:nx
    for j = 1:ny
        n = j + (i-1)*ny;
        if (i == 1 || i == nx ||j == 1 || j == ny)
            S(n,n) = 1;
        else
            S(n, n) = -4;
            S(n, n+1) = 1;
            S(n, n-1) = 1;  
            S(n, n+ny) = 1; 
            S(n, n-ny) = 1; 
        end
    end
    pause(0.01)
end

figure(1) 
spy(S)
[E, D] = eigs(S, 9, 'SM');
grid on;

N = zeros(nx, ny, 9);
figure(2)
for k = 1:9
   N(:, :, k) = reshape(E(:, k), nx, ny);
   subplot(3, 3, k)
   surf(N(:,:,k))
   
end