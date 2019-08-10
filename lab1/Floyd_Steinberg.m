function y = Floyd_Steinberg(x,k)
% FLOYD_STEINBERG Perform Floyd-Steinberg error diffusion.
%  Y = FLOYD_STEINBERG(X) performs Floyd-Steinberg error diffusion on
%  grayscale image X.  X must be of type double, and must be in the range
%  [0, 255].  Y has the range [0, 1].
tic;

% Pad input image with zeros along sides and bottom.
[M, N] = size(x);
y = zeros(M, N);
x = [ zeros(M, 1) x / 255 zeros(M, 1); zeros(1, N + 2) ];
x_save=x;

%Filter and threshold.
T = 0.5;

% Scan image and halftone.
for i = 1 : M
    for j = 2 : N + 1
        q = ((k-1)*x_save(i,j)+x(i, j)) >= T;
        e(i,j) = x(i, j)-q;
        x(i,j+1)=x(i,j+1)+e(i,j)*7/16;
        x(i+1,j-1)=x(i+1,j-1)+e(i,j)*3/16;
        x(i+1,j)=x(i+1,j)+e(i,j)*5/16;
        x(i+1,j+1)=x(i+1,j+1)+e(i,j)*1/16;
        y(i, j - 1) = q;
    end
end

toc;
%imwrite(y,'girl.jpg','jpg');
